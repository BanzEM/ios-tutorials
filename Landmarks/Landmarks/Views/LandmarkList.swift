//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bandisile Mazomba on 2026/10/27.
//

import SwiftUI

struct LandmarkList: View {
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                   (!modelData.showFavoritesOnly || landmark.isFavorite)
               }
    }
    
    
    @Environment(ModelData.self) private var modelData
    
    var body: some View {
        
        NavigationStack {
            Toggle(isOn: Bindable(modelData).showFavoritesOnly) {
                                Text("Favorites only")
                            }
            List(filteredLandmarks) { landmark in
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
