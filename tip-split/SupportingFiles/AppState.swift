//
//  AppState.swift
//  tip-split
//
//  Created by Linder Anderson Hassinger Solano    on 7/09/22.
//

import Foundation

class AppState: ObservableObject {
    
    static let shared = AppState()
    
    @Published var currentScreen: AppScreens = .launch
    
}
