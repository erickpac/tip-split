//
//  tip_splitApp.swift
//  tip-split
//
//  Created by epac on 6/09/22.
//

import SwiftUI

@main
struct tip_splitApp: App {
    
    @StateObject var appState: AppState = .shared
    
    var body: some Scene {
        WindowGroup {
            switch appState.currentScreen {
            case .launch:
                LaunchView()
            case .home:
                ContentView()
            }
        }
    }
}
