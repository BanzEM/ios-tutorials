//
//  DataContainer.swift
//  GratefulMoments
//
//  Created by Bandisile Mazomba on 2026/09/28.
//

import SwiftData
import SwiftUI

@Observable
@MainActor
class DataContainer {
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(){
        
        let schema = Schema([
            Moment.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do{
            modelContainer = try ModelContainer(for: schema, configurations:[modelConfiguration])
            
            loadSampleMoments()
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
        
    }
    
    private func loadSampleMoments(){
        
        for moment in Moment.sampleData{
            context.insert(moment)
        }
        
    }
}

private let sampleContainer = DataContainer(includeSampleMoments: true)


extension View {
    func sampleDataContainer() -> some View {
        self
            .environment(sampleContainer)
            .modelContainer(sampleContainer.modelContainer)
    }
}
