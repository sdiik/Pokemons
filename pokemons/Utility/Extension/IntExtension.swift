//
//  IntExtension.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 23/10/23.
//

import Foundation

extension Int {
    var imageURL: String {
        let new = BASE_IMAGE_URL.replacing("id", with: "\(self)")
        return new
    }
}
