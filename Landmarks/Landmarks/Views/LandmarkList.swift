//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bandisile Mazomba on 2026/10/27.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) private var modelData
    
    var body: some View {
        
        NavigationStack {
            
            List(modelData.landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                    
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } 
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
