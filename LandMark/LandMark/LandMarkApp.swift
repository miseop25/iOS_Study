//
//  LandMarkApp.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/08/01.
//

import SwiftUI

@main
struct LandMarkApp: App {
    @StateObject private var modeldata = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modeldata)
        }
    }
}
