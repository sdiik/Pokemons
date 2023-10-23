//
//  DetailPokemonView.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import SwiftUI

struct DetailPokemonView: View {
    var pokemon: Pokemon
    @State var imageName: String = ""
    
    @ObservedObject var detailPokemonViewModel = DetailPokemonViewModel()
    var backgroundColor: UIColor {
        PokemonType(rawValue: pokemon.type)?.color ?? .green
    }

    var body: some View {
        GeometryReader { geo in
            VStack {
                AsyncImage(url: URL(string: pokemon.id.imageURL), scale: 2)
                    .padding(.bottom, -50)
                    .padding(.top, 50)
                    .zIndex(1)
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 50).frame(width: geo.size.width, height: geo.size.height)
                        .ignoresSafeArea()
                        .foregroundColor(.white)
                    VStack(spacing: 20) {
                        Text(pokemon.name).font(.largeTitle)
                        HStack {
                            TypeOfPokemonView(type: pokemon.type, color: backgroundColor).overlay {
                                Button {
                                    detailPokemonViewModel.setFavorite(with: pokemon.id)
                                    imageName =  FavoritesSaved.isAlreadyFavoriteId(id: pokemon.id)
                                    ? "heart.fill"
                                    : "heart"
                                } label: {
                                    Image(systemName: imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color(backgroundColor))
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing, 200)
                                }
                            }
                        }
                        Text(pokemon.description).padding(.horizontal)
                        DescriptionOfPokemonView(pokemon: pokemon)
                    }.padding(.top, 50)
                }
            }.background(Color(backgroundColor))
        }
        .ignoresSafeArea()
        .onAppear() {
            imageName =  FavoritesSaved.isAlreadyFavoriteId(id: pokemon.id)
            ? "heart.fill"
            : "heart"
        }
    }
}
