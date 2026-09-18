//
//  ContentView.swift
//  Country_API
//
//  Created by Bandisile Mazomba on 2026/09/03.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CountryViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            viewModel.getCountries()
            
        }
    }
}

#Preview {
    ContentView()
}
