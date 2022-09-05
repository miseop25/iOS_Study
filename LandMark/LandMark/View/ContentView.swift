//
//  ContentView.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/08/01.
//

import SwiftUI

struct ContentView: View {
    @State private var modelData = ModelData()
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem {
                    Label("list", systemImage: "list.bullet")
                }
            
                .tag(Tab.list)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
