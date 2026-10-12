//
//  GratefulMomentsApp.swift
//  GratefulMoments
//
//  Created by Bandisile Mazomba on 2026/09/21.
//

import SwiftUI
import SwiftData

@main
struct GratefulMomentsApp: App {
    let dataContainer = DataContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)
    }
}
