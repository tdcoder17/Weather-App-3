//
//  ContentView.swift
//  Weather App 3
//
//  Created by Theo Davis on 1/6/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationMgr = LocationMgr()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
        
        if let location = locationMgr.location {
            if let weather = weather {
                Text("Weather data fetched!")
            } else {
                LoadingView()
                    .task {
                        do {
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
            }
        } else {
            if locationMgr.isLoading {
                LoadingView()
            } else {
                    WelcomeView()
                        .environmentObject(locationMgr)
            }
        }
    }
    .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
    .preferredColorScheme(.dark)
    }
}//end of struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
}//end of struct
