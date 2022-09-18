//
//  ContentView.swift
//  RainCheck
//
//  Created by Pranav Karthik on 2022-09-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var weatherAPIClient = WeatherAPIClient()
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            if let currentWeather = weatherAPIClient.currentWeather  {
                HStack(alignment: .center, spacing: 16) {
                    currentWeather.weatherCode.image
                        .font(.largeTitle)
                    Text("\(currentWeather.temperature)º")
                        .font(.largeTitle)
                }
                Text(currentWeather.weatherCode.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
            } else {
                Text("No rain today!")
                    .font(.body)
                    .multilineTextAlignment(.center)
                Button("Refresh", action: {
                    Task {
                        await weatherAPIClient.fetchWeather()
                    }
                })
            }
            Spacer()
        }
        .onAppear {
            Task {
                await weatherAPIClient.fetchWeather()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
