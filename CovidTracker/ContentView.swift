//
//  ContentView.swift
//  CovidTracker
//
//  Created by Siddharth sen on 4/11/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI

private struct Tab: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Tab(imageName: "chart.bar", text: "stats")
            }
            .tag(0)
            
            GraphView()
                .edgesIgnoringSafeArea(.vertical)
                .tabItem {
                    Tab(imageName: "map", text: "Maps")
            }
            .tag(1)
            
            MainView()
                .tabItem {
                    Tab(imageName: "tray.full", text: "Advices")
            }
            .tag(2)
            
            MainView()
                .tabItem {
                    Tab(imageName: "person", text: "About")
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
