//
//  TabItem.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

enum TabItem: Int, CaseIterable {
    case home = 0
    case favorite
    
    var title: String {
        switch self {
        case .home:
            return "home"
        case .favorite:
            return "favorite"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        }
    }
    
    var navigationTitle: String {
        switch self {
        case .home:
            return "Pokemon"
        case .favorite:
            return "Favorites"
        }
    }
    
    
}
