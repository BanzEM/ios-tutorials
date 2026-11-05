//
//  ContentView.swift
//  Biography
//
//  Created by Bandisile Mazomba on 2026/11/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Text("")
            }
            .background(Color(red: 235/255, green: 235/255, blue: 227/255))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.top)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
