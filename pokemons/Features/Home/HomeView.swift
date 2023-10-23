//
//  HomeView.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import SwiftUI

struct HomeView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = HomeViewModel()
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
