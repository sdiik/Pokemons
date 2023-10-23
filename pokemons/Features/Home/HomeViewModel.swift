//
//  HomeViewModel.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()
    @Published var hasError: Bool = false
    @Published var message: String = ""
    
    internal func fetchPokemon() {
        PokemonService().getPokemons() { [weak self] result, message in
            guard let self = self else { return }
            if let alreadyData = result {
                self.pokemons = alreadyData
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
        vm.title = TabItem.home.navigationTitle
        return vm
    }
}
