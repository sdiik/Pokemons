//
//  PokemonType.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import Foundation
import UIKit

enum ProgressType: String,  CaseIterable {
    case weight
    case attack
    case defense
    
    var color: UIColor {
        switch self {
        case .weight:
            return .blue
        case .attack:
            return .red
        case .defense:
            return .yellow
        }
    }
}

enum PokemonType: String, CaseIterable {
    case fire
    case poison
    case water
    case electric
    case psychis
    case normal
    case ground
    case flying
    case fairy
    
    var color: UIColor {
        switch self {
        case .fire:
            return .systemRed
        case .poison:
            return .systemGreen
        case .water:
            return .systemTeal
        case .electric:
            return .systemYellow
        case .psychis:
            return .systemPurple
        case .normal:
            return .systemOrange
        case .ground:
            return .systemGray
        case .flying:
            return .systemCyan
        case .fairy:
            return .systemPink
        }
    }
}
