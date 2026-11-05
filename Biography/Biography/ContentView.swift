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
                Ellipse().fill(Color(red: 78/255, green: 88/255, blue: 81/255))
                    .rotationEffect(.degrees(90))
                    .offset(y: -proxy.size.height  * 0.5)
                    .edgesIgnoringSafeArea(.top)
                
                VStack(alignment: .leading, spacing: 24) {
                    VStack(spacing: 20) {
                        Text("The Crazy Ones")
                            .font(.system(size: 36, weight: .medium))
                        Text("The misfits. The rebels. The troublemakers. The round pegs in the square holes. The ones who see things differently.")
                            .font(.system(size: 17))
                    }
                }
                .background(Color(red: 235/255, green: 235/255, blue: 227/255))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}




#Preview {
    ContentView()
}
