//
//  ViewController.swift
//  PokedexIOS
//
//  Created by David Ortiz on 27/09/23.
//

import UIKit
import Combine
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeActivityIndicator: UIActivityIndicatorView!
    
    var viewModel = PokemonViewModel()
    var anyCancellable: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeActivityIndicator.hidesWhenStopped = true
        homeActivityIndicator.startAnimating()
        
        subscriptions()
        viewModel.getPokemons()
        homeActivityIndicator.stopAnimating()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.register(UINib(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "pokemonCustomCell")
        
    }
    
    
    // MARK: FUNCTIONS

    func subscriptions() {
        
        viewModel.reloadData.sink { _ in } receiveValue: { _ in
            self.homeTableView.reloadData()
        }.store(in: &anyCancellable)

    }

}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.pokemonList?.count != nil {
            return viewModel.pokemonList!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pokemon = viewModel.pokemonList![indexPath.row]
        
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "pokemonCustomCell", for: indexPath) as? PokemonTableViewCell
        
        cell?.pokemonName.text = pokemon.name.capitalized
        cell?.pokemonImage.kf.setImage(with: pokemon.image)
        
        return cell!
        
    }
    
    
    
    
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = DetailsViewController()
        detailsVC.pokemon = viewModel.pokemonList![indexPath.row]
        present(detailsVC, animated: true)
        
    }
    
}

