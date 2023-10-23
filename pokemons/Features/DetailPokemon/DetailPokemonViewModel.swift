//
//  DetailPokemonViewModel.swift
//  testing
//
//  Created by ahmad shiddiq on 25/09/23.
//

import Foundation

class DetailPokemonViewModel: ObservableObject {
    
    func setFavorite(with id: Int) {
        if FavoritesSaved.isAlreadyFavoriteId(id: id) {
            FavoritesSaved.removeFavoriteId(id: id)
        } else {
            FavoritesSaved.setFavoriteIds(with: id)
        }
    }
}
