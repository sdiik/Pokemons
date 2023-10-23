//
//  ProgressBarView.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import Foundation
import SwiftUI

enum ProgressBarViewType {
    case home
    case detail
}
struct ProgressBarView: View {
    var type: ProgressBarViewType
    var pokemon: Pokemon
    var progressBarType: ProgressType
    var backgroundColor: Color
    var progressValue: Double
    
    init(
        type: ProgressBarViewType,
        pokemon: Pokemon,
        progressBarType: ProgressType
    ) {
        self.type = type
        self.pokemon = pokemon
        self.progressBarType = progressBarType
        if type == .home {
            self.backgroundColor = Color(progressBarType.color)
        } else {
            self.backgroundColor = Color(PokemonType(rawValue: pokemon.type)?.color ?? .green)
        }
        switch progressBarType {
        case .weight:
            progressValue = CGFloat((CGFloat(pokemon.weight)/100))
        case .attack:
            progressValue = CGFloat((CGFloat(pokemon.attack)/100))
        case .defense:
            progressValue = CGFloat((CGFloat(pokemon.defense)/100))
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: type == .home ? 3 : 8)
                .opacity(0.3)
                .foregroundColor(backgroundColor)
            Circle()
                .trim(from: 0.0, to: progressValue)
                .stroke(style: StrokeStyle(lineWidth: type == .home ? 3 : 8, lineCap: .round, lineJoin: .round))
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(format: "%.1f", progressValue))
                .font(.system(size: type == .home ? 5 : 12))
                .bold()
        }.frame(width: type == .home ? 24 : 50, height: type == .home ? 24 : 50)
    }
}
