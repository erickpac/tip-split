//
//  LaunchViewModel.swift
//  tip-split
//
//  Created by Linder Anderson Hassinger Solano    on 7/09/22.
//

import Foundation

class LaunchViewModel: ObservableObject {
    
    var appState: AppState = .shared
    
    init() {
        appState.currentScreen = .home
    }
}
