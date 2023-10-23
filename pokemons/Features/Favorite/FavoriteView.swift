//
//  FavoriteView.swift
//  Pokemons
//
//  Created by Asani on 23/10/23.
//

import SwiftUI

struct FavoriteView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = FavoriteViewModel()
    var other = CustomNavigationViewModel()
    @State var safeAreaInsets: EdgeInsets = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationView(vm:viewModel.setupNavigationBar())
                .frame(height: 48)
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(viewModel.pokemons) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }.padding(.top, 8)
            }
            .task {
                viewModel.fetchPokemon()
            }
        }.padding(.bottom, 8)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
