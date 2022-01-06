//
//  ContentView.swift
//  Weather App 3
//
//  Created by Theo Davis on 1/6/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationMgr = LocationMgr()
    
    var body: some View {
        VStack{
        
        if let location = locationMgr.location {
            Text("Your coordinates are: \(location.longitude), \(location.latitude)")
        } else {
            if locationMgr.isLoading {
                ProgressView()
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
