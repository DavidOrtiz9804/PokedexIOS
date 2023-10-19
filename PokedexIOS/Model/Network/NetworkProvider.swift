//
//  NetworkProvider.swift
//  PokedexIOS
//
//  Created by David Ortiz on 27/09/23.
//

import Foundation
import Alamofire

final class NetworkProvider {
    
    static let shared = NetworkProvider()
    
    private let baseUrl = "https://pokeapi.co/api/v2/"
    
    // **********   FUNCIONALIDAD GET ALL POKEMONS   **********
    
    func getAllPokemons( success: @escaping (_ pokemons: [Pokemon]) -> (), failure: @escaping (_ error: Error?) -> () ) {
        
        let url = baseUrl + "pokemon?limit=151"
        
        AF.request(url, method: .get).responseDecodable(of: PokeModel.self) { response in
            
            if let pokemons = response.value?.results {
                success(pokemons)
            } else {
                failure(response.error)
            }
            
        }
        
    }
    
}
