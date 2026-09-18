//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Bandisile Mazomba on 2026/09/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            DayForecast(day: "Mon", isRainy: false, high: 30, low: 10)
            
            DayForecast(day: "Tues", isRainy: true, high: 25, low: 8)
        }
    }
}

struct DayForecast: View {
    
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy{
          return  "cloud.rain.fill"
        }
       return "sun.max.fill"
    }
    
    var iconColor: Color {
        if isRainy{
            return Color.blue
        }
        return Color.yellow
    }
    
    var body: some View {
        
        VStack {
            Text(day)
                .font(Font.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .padding(10)
                .font(Font.largeTitle)
                .padding(5)
            Text("High: \(high) ºC")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low) ºC")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
