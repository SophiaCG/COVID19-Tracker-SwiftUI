//
//  COVID19_Tracker_SwiftUIApp.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//

import SwiftUI
import Firebase

@main
struct COVID19_Tracker_SwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
