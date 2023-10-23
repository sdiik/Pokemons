//
//  MainTabView.swift
//  Pokemons
//
//  Created by ahmad shiddiq on 22/10/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Label(TabItem.home.title, systemImage: TabItem.home.iconName)
                    }
                FavoriteView()
                    .tabItem {
                        Label(TabItem.favorite.title, systemImage: TabItem.favorite.iconName)
                    }
            }
        }
    }
}

extension MainTabView {
    func customTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : .gray)
                .frame(width: 20, height: 20)
            if isActive {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? .purple.opacity(0.4) : .clear)
        .cornerRadius(30)
    }
}
