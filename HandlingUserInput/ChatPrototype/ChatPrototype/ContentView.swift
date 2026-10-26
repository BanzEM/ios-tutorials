//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Bandisile Mazomba on 2026/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Knock, Konck!")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
               
            Text("Who's there?")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
