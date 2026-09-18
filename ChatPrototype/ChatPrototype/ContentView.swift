//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Bandisile Mazomba on 2026/09/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            Text("Notes App")
                .padding(50)
            Image(systemName: "arrow.2.circlepath.circle")
                .padding(50)
        }
    
        
        VStack (spacing: 45) {
            Text("Knock, Knock!")
                .padding(50)
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 1))
                .shadow(radius: 10.5)
            
               
            Text("How do you do?")
                .padding(50)
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 1))
                .shadow(radius: 10.5)
        }
        .padding()
        
        
    }
}

#Preview {
    ContentView()
}
