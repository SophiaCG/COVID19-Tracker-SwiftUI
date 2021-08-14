//
//  ContentView.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    @State var country = ""
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear() {
                ViewModel().getResults { results in
                    self.country = results[0].country
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
