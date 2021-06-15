//
//  StringSources.swift
//  Pokedex
//
//  Created by Heyner Rodriguez on 13/06/21.
//

import Foundation

class StringSources {
    
    static let shared = StringSources()
    
    // -- Image names -- //
    let navBarImage = "static_ic_search"
    let navBarBack = "static_ic_back"
    let pokemonBackground: [String] = ["pokemon_background", "region_background","berries_background","abilities_background","items_background"]
    
    // -- Urls -- //
    let urlBase = "https://pokeapi.co/api/v2/"
    let pokemonImageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    
    // -- Paths -- //
    lazy var sectionsPathArray = [pokemonPath, regionPath, berriesPath, abilitiesPath, pokeballsPath]
    let pokemonPath = "pokemon/?offset=0&limit=1118"
    let regionPath = "region/"
    let berriesPath = "berry?offset=0&limit=64"
    let abilitiesPath = "ability?offset=0&limit=100"
    let pokeballsPath = "item?offset=0&limit=16"
    
    // -- Keys -- //
    let sectionsTableViewKey = "sectionsTableViewKey"
    let PokemonSectionCellKey = "PokemonSectionCellKey"
    
    // -- Copies -- //
    let homeTitle = "PokeHome"
    /// -- Section titles --
    lazy var sectionTitles: [String] = ["Pokemons", "Regiones", "Bayas", "Habilidades", "Pokeballs"]
}
