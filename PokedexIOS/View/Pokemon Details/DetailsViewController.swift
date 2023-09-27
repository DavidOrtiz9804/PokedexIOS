//
//  DetailsViewController.swift
//  PokedexIOS
//
//  Created by David Ortiz on 28/09/23.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet weak var pokemonID: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pokemonData = pokemon {
            let pkid = "# " + String(pokemonData.id!)
            pokemonID.text = pkid
            pokemonImage.kf.setImage(with: pokemonData.image)
            pokemonName.text = pokemonData.name.capitalized
        }
        
    }

}
