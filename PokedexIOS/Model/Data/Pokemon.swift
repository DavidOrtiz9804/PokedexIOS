//
//  Pokemon.swift
//  PokedexIOS
//
//  Created by David Ortiz on 27/09/23.
//

import Foundation

struct Pokemon: Decodable {
    
    let name: String
    let url: String
    
    var id: Int? {
        return Int(url.split(separator: "/").last?.description ?? "0")
    }
    
    var image: URL? {
        let stringUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id ?? 0).png"
        return URL(string: stringUrl)
    }
    
}
