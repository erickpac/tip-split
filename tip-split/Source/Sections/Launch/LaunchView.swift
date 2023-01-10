//
//  LaunchView.swift
//  tip-split
//
//  Created by Linder Anderson Hassinger Solano    on 7/09/22.
//

import SwiftUI

struct LaunchView: View {
    
    @StateObject var launchViewModel = LaunchViewModel()
    
    var body: some View {
        VStack {
            Image("splash")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
