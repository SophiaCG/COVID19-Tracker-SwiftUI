//
//  ContentView.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    @State var totalCases = 0
    
    var body: some View {
        
        Text("TOTAL: \(totalCases)")
            .onAppear() {
                ViewModel().getResults { results in
                    self.totalCases = results.data.summary.total_cases
                }
            }
        
//        VStack{
//            BarChart(entries: [
//                //x - position of a bar, y - height of a bar
//                BarChartDataEntry(x: 1, y: 1),
//                BarChartDataEntry(x: 2, y: 2),
//                BarChartDataEntry(x: 3, y: 3),
//                BarChartDataEntry(x: 4, y: 4),
//                BarChartDataEntry(x: 5, y: 5)
//
//            ]).frame(width: UIScreen.main.bounds.width * 0.9, height: 300, alignment: .center)
//
//            LineChart(entries: [
//                //x - position of a bar, y - height of a bar
//                ChartDataEntry(x: 1, y: 41),
//                ChartDataEntry(x: 2, y: 23),
//                ChartDataEntry(x: 3, y: 34),
//                ChartDataEntry(x: 4, y: 64),
//                ChartDataEntry(x: 5, y: 15)
//
//            ]).frame(width: UIScreen.main.bounds.width * 0.9, height: 300, alignment: .center)
//
//            PieChart(entries: [
//                //x - position of a bar, y - height of a bar
//                ChartDataEntry(x: 1, y: 41),
//                ChartDataEntry(x: 2, y: 23),
//                ChartDataEntry(x: 3, y: 34),
//                ChartDataEntry(x: 4, y: 64),
//                ChartDataEntry(x: 5, y: 15)
//
//            ]).frame(width: UIScreen.main.bounds.width * 0.9, height: 250, alignment: .center)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
