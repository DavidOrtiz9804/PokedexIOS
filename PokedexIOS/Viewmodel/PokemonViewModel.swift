//
//  PokemonViewModel.swift
//  PokedexIOS
//
//  Created by David Ortiz on 27/09/23.
//

import Foundation
import Combine

class PokemonViewModel {
    
    var pokemonList: [Pokemon]? = nil
    var reloadData = PassthroughSubject<Void, Error>()
    
    // **********   FUNCIONALIDAD GET ALL POKEMONS   **********
    
    func getPokemons() {
        
        DispatchQueue.global(qos: .background).async {
            
            NetworkProvider.shared.getAllPokemons { pokemons in
                
                self.pokemonList = pokemons
                self.reloadData.send()
                
            } failure: { error in
                
                print("Error al obtener datos.")
                
            }
            
        }
        
    }
    
    
}
