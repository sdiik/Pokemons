//
//  NavigationViewModel.swift
//  testing
//
//  Created by ahmad shiddiq on 22/10/23.
//

import Foundation

class CustomNavigationViewModel: ObservableObject {
    @Published var isCenterTitleNavigation: Bool = false
    @Published var isHiddenLeftButton: Bool = false
    @Published var isHiddenRightButton: Bool = true
    @Published var isCustomBackButtonAction: Bool = true
    @Published var title: String = ""
    
    
    init(
        isCenterTitleNavigation: Bool = false,
        isHiddenLeftButton: Bool = false,
        isHiddenRightButton: Bool = true,
        isCustomBackButtonAction: Bool = true,
        title: String = ""
    ) {
        self.isCenterTitleNavigation = isCenterTitleNavigation
        self.isHiddenLeftButton = isHiddenLeftButton
        self.isHiddenRightButton = isHiddenRightButton
        self.isCustomBackButtonAction = isCustomBackButtonAction
        self.title = title
    }
}
