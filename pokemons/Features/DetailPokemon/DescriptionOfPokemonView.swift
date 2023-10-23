//
//  DescriptionOfPokemonView.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import SwiftUI

struct DescriptionOfPokemonView: View {
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(.white).shadow(radius: 10)
                .frame(width: 350, height: 120).overlay {
                    HStack(spacing: 48) {
                        VStack(alignment: .center) {
                            ProgressBarView(type: .detail, pokemon: pokemon, progressBarType: .attack)
                            Text("Attach").font(.subheadline).bold()
                        }
                        VStack(alignment: .center) {
                            ProgressBarView(type: .detail, pokemon: pokemon, progressBarType: .defense)
                            Text("Defense").font(.subheadline).bold()
                        }
                        VStack(alignment: .center) {
                            ProgressBarView(type: .detail, pokemon: pokemon, progressBarType: .weight)
                            Text("Weight").font(.subheadline).bold()
                        }
                    }.padding()
                }
        }
    }
}
