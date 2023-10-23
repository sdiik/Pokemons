//
//  FavoriteViewModel.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 23/10/23.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var pokemonLikes = [Pokemon]()
    @Published var pokemons = [Pokemon]()
    @Published var hasError: Bool = false
    @Published var message: String = ""
    
    internal func fetchPokemon() {
        PokemonService().getPokemons() { [weak self] result, message in
            guard let self = self else { return }
            if let alreadyData = result {
                let filtered: [Pokemon] = alreadyData.filter { pokemon in
                    for id in FavoritesSaved.getFavoriteIds() {
                        if id == pokemon.id {
                            return true
                        }
                    }
                    return false
                }
                self.pokemons = filtered
            } else {
                self.hasError = true
                self.message = message?.localizedDescription ?? ""
            }
        }
    }
    
    internal func setupNavigationBar() -> CustomNavigationViewModel {
        let vm = CustomNavigationViewModel()
        vm.isHiddenLeftButton = true
        vm.isHiddenRightButton = true
        vm.isCenterTitleNavigation = true
        vm.title = TabItem.favorite.navigationTitle
        return vm
    }
}
