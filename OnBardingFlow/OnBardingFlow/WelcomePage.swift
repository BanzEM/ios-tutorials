//
//  WelcomePage.swift
//  OnBardingFlow
//
//  Created by Bandisile Mazomba on 2026/09/16.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 200, height: 200)
                    .foregroundStyle(Color.green)
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
            }
            
            Text("Welcome to my App")
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.serif)
                .padding(.top)
               // .border(Color.red, width: 1.5)
            
            Text("Description Text for this page for viewers")
                .font(.title2)
                .multilineTextAlignment(.center)
               // .border(Color.blue, width: 1.5)
        }
        //.border(Color.yellow, width: 1.5)
        .padding()
        //.border(Color.black, width: 1.5)
    }
}

#Preview {
    WelcomePage()
}
