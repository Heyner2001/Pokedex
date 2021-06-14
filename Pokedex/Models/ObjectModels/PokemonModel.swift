//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 13/06/21.
//

import Foundation

struct AllPokemons: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
}

struct Pokemon: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
}

var allPokemons: AllPokemons? = nil 

class PokemonModel {
    
}
