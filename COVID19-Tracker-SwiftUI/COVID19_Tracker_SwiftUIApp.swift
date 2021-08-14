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
    
    var body: some Scene {
        WindowGroup {
            ContentView(entries: [
                //x - position of a bar, y - height of a bar
                BarChartDataEntry(x: 1, y: 1),
                BarChartDataEntry(x: 2, y: 1),
                BarChartDataEntry(x: 3, y: 1),
                BarChartDataEntry(x: 4, y: 1),
                BarChartDataEntry(x: 5, y: 1)

            ])
        }
    }
}
