//
//  PokemonCell.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import SwiftUI

struct PokemonCell: View {
    @State var pokemon: Pokemon
    var pokemonType: PokemonType
    var backgroundColor: Color
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.pokemonType = PokemonType(rawValue: pokemon.type) ?? .normal
        self.backgroundColor = Color(pokemonType.color)
    }
    
    var body: some View {
        NavigationLink(destination: DetailPokemonView(pokemon: pokemon)) {
            ZStack {
                VStack(alignment: .leading) {
                    Text(pokemon.name)
                        .padding(.top, 8)
                        .padding(.leading)
                        .foregroundColor(.white)
                        .font(.system(size: 14)).bold()
                    HStack{
                        VStack(spacing: 0) {
                            Text(pokemon.type)
                                .foregroundColor(.white)
                                .font(.system(size: 12)).bold()
                                .padding(.horizontal, 6)
                                .padding(.vertical, 6)
                                .overlay {
                                    Rectangle()
                                        .fill(.white.opacity(0.25))
                                        .cornerRadius(10)
                                }
                                .frame(width: 100, height: 16)
                            HStack {
                                ProgressBarView(type: .home, pokemon: pokemon, progressBarType: .attack)
                                ProgressBarView(type: .home, pokemon: pokemon, progressBarType: .defense)
                                ProgressBarView(type: .home, pokemon: pokemon, progressBarType: .weight)
                            }.padding()
                        }
                        AsyncImage(
                            url: URL(string: pokemon.id.imageURL),
                            scale: 3,
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            }, placeholder: {
                                ProgressView()
                            }
                        )
                        .frame(width: 48, height: 48)
                        .padding([.trailing, .bottom], 8)
                    }
                    
                }
            }.background(backgroundColor)
                .cornerRadius(20)
                .shadow(color: backgroundColor, radius: 10, x: 0, y: 0)
        }
    }
}
