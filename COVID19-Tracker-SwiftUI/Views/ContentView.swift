//
//  ContentView.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//

import SwiftUI
import Charts

/*
 TO-DO:
 1. Add historical data API
 2. Connect search bar to list
 3. Connect news stories to web links
 4. Connect data to charts
 5. Refactor text fields
 6. Add Firebase
 7. Add Combine
 8. Add Unit Tests
 */

struct ContentView: View {
    
    @State var result: [StatsResults] = []
    @State var countriesList: [CountriesList] = []
    @State var isEditing: Bool = false
    @Binding var text: String
    
    var body: some View {
        
        SearchBar(text: text, isEditing: $isEditing)

        ZStack {
            
            if !isEditing {
                ScrollView {
                    
                    VStack (spacing: 60) {
                        VStack (alignment: .center, spacing: 30) {
                            HStack {
                                Text("World Statistics")
                                    .bold()
                                    .font(.title)
                                    .padding(.leading, 12)
                                    .padding(.bottom, -15)
                                Spacer()
                            }
                            HStack (alignment: .center, spacing: 30) {
                                VStack (spacing: 10) {
                                    Text("Total Cases")
                                        .bold()
                                        .font(.title3)
                                        .foregroundColor(Color(UIColor.systemGray))
                                    Text("\(result.count != 0 ? result[0].TotalCases : 0)")
                                        .bold()
                                        .foregroundColor(.yellow)
                                    Text("\(result.count != 0 && result[0].NewCases >= 0 ? "+" : "")\(result.count != 0 ? result[0].NewCases : 0)")
                                        .bold()
                                        .font(.subheadline)
                                        .foregroundColor(.yellow)
                                        .opacity(0.6)
                                }
                                VStack (spacing: 10) {
                                    Text("Recovered")
                                        .bold()
                                        .font(.title3)
                                        .foregroundColor(Color(UIColor.systemGray))
                                    Text("\(result.count != 0 ? result[0].TotalRecovered : "0")")
                                        .bold()
                                        .foregroundColor(.green)
                                    Text("\(result.count != 0 && result[0].NewRecovered >= 0 ? "+" : "")\(result.count != 0 ? result[0].NewRecovered : 0)")
                                        .bold()
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                        .opacity(0.6)
                                }
                                VStack (spacing: 10) {
                                    Text("Deaths")
                                        .bold()
                                        .font(.title3)
                                        .foregroundColor(Color(UIColor.systemGray))
                                    Text("\(result.count != 0 ? result[0].TotalDeaths : 0)")
                                        .bold()
                                        .foregroundColor(.red)
                                    Text("\(result.count != 0 && result[0].NewDeaths >= 0 ? "+" : "")\(result.count != 0 ? result[0].NewDeaths : 0)")
                                        .bold()
                                        .font(.subheadline)
                                        .foregroundColor(.red)
                                        .opacity(0.6)
                                    
                                }
                                
                            }
                            
                            HStack (alignment: .center, spacing: 30) {
                                VStack (spacing: 10) {
                                    Text("Active Cases")
                                        .bold()
                                        .font(.title3)
                                        .foregroundColor(Color(UIColor.systemGray))
                                    Text("\(result.count != 0 ? result[0].ActiveCases : 0)")
                                        .bold()
                                        .foregroundColor(.blue)
                                }
                                VStack (spacing: 10) {
                                    Text("Critical")
                                        .bold()
                                        .font(.title3)
                                        .foregroundColor(Color(UIColor.systemGray))
                                    Text("\(result.count != 0 ? result[0].Serious_Critical : 0)")
                                        .bold()
                                        .foregroundColor(.orange)
                                }
                                VStack (spacing: 10) {
                                    Text("Tested")
                                        .bold()
                                        .font(.title3)
                                        .foregroundColor(Color(UIColor.systemGray))
                                    Text("\(result.count != 0 ? result[0].TotalTests : "0")")
                                        .bold()
                                        .foregroundColor(.purple)
                                }
                            }
                        }
                        
                        PieChart(entries: [
                            ChartDataEntry(x: 1, y: 41),
                            ChartDataEntry(x: 2, y: 23),
                            ChartDataEntry(x: 3, y: 34),
                            ChartDataEntry(x: 4, y: 64),
                            ChartDataEntry(x: 5, y: 15)
                        ]).frame(width: 380, height: 380, alignment: .center)
                        
                        HStack {
                            Text("Historial Data of the World")
                                .bold()
                                .font(.title)
                                .padding(.leading, 12)
                                .padding(.bottom, -40)
                            Spacer()
                        }
                        LineChart(entries: [
                            ChartDataEntry(x: 1, y: 41),
                            ChartDataEntry(x: 2, y: 23),
                            ChartDataEntry(x: 3, y: 34),
                            ChartDataEntry(x: 4, y: 64),
                            ChartDataEntry(x: 5, y: 15)
                        ]).frame(width: UIScreen.main.bounds.width * 0.9, height: 300, alignment: .center)
                        
                        HStack {
                            Text("Countries with the Most Cases")
                                .bold()
                                .font(.title)
                                .padding(.leading, 12)
                                .padding(.bottom, -40)
                            Spacer()
                        }
                        BarChart(entries: [
                            BarChartDataEntry(x: 1, y: 1),
                            BarChartDataEntry(x: 2, y: 2),
                            BarChartDataEntry(x: 3, y: 3),
                            BarChartDataEntry(x: 4, y: 4),
                            BarChartDataEntry(x: 5, y: 5)
                        ]).frame(width: UIScreen.main.bounds.width * 0.9, height: 300, alignment: .center)
                        
                    }
                }
                .onAppear() {
                    ViewModel().getResults { (results) in
                        result.append(results[0])
                        print("APPENDED \(results[0].ActiveCases) TO \(result[0].ActiveCases)")
                    }
                }
                
            } else {
                ListView(countriesList: $countriesList, text: $text, isEditing: $isEditing)
            }
            
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(text: "")
//    }
//}
