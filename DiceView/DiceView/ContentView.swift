//
//  ContentView.swift
//  DiceView
//
//  Created by Bandisile Mazomba on 2026/09/19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack {
            
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            
            HStack{
                
                Button("Remove Die") {
                    withAnimation{
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1)
                
                Button("Add Die") {
                    withAnimation{
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 3)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
