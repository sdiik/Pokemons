//
//  TypeOfPokemonView.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import SwiftUI

struct TypeOfPokemonView: View {
    var type: String
    var color: UIColor
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(color))
                .frame(width: 150, height: 50)
            HStack(spacing: 15) {
                Image(systemName: "flame.fill").resizable().scaledToFit().frame(width: 25, height: 25)
                Text(type)
            }
        }
    }
}
