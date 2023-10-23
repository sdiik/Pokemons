//
//  Pokemon.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let name: String
    let id: Int
    let type: String
    let imageUrl: String
    let description: String
    let attack: Int
    let defense: Int
    let height: Int
    let weight: Int
}
