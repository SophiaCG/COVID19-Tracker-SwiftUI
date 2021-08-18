//
//  COVID19_Tracker_SwiftUIApp.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//

import SwiftUI
import Firebase
import Charts

@main
struct COVID19_Tracker_SwiftUIApp: App {
    
    init() {
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-CTS", ofType: "plist")!
        let options = FirebaseOptions(contentsOfFile: filePath)
        FirebaseApp.configure(options: options!)
    }
    
    @State var text: String = ""
    @State var isEditing: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NewsView()
//            ContentView(text: $text)
        }
    }
}
