//
//  FocusTrackApp.swift
//  FocusTrack
//
//  Created by Arman on 21/4/25.
//

import SwiftUI

@main
struct FocusTrackApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView()
            {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            
        }
    }
}
