//
//  PokemonTableViewCell.swift
//  PokedexIOS
//
//  Created by David Ortiz on 27/09/23.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        pokemonName.font = UIFont.boldSystemFont(ofSize: 20)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
