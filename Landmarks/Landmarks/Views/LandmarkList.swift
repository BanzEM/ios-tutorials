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
        
        List(modelData.landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
