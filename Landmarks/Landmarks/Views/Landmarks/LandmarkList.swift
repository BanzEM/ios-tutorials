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
        
        @Bindable var modelData = modelData

        
        NavigationStack {
            
            List {
                Toggle(isOn: Bindable(modelData).showFavoritesOnly) {
                                    Text("Favorites only")
                                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                        
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
