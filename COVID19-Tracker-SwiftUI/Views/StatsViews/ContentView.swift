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
 1. Add historical data API-
 2. Connect search bar to list
 3. Connect news stories to web links-
 4. Connect data to charts
 5. Refactor text fields-
 6. Add Firebase
 7. Add Combine
 8. Add Unit Tests
 */

struct StatsData {
    var names: [String] = ["Total Cases", "Recovered", "Deaths", "Active Cases", "Critical", "Tested"]
    var colors: [Color] = [.yellow, .green, .red, .blue, .orange, .purple]
    var results: [Int] = []
    var subResults: [Int] = []
}

struct StatsView: View {
    
    var names: [String] = ["Total Cases", "Recovered", "Deaths", "Active Cases", "Critical", "Tested"]
    
    var body: some View {
        
        ForEach(0..<names.count/3) { row in // create number of rows
            HStack {
                ForEach(0..<3) { column in // create 3 columns
                    Text(self.names[row * 3 + column])
                }
            }
        }
    }
}

struct ContentView: View {
    
    @State var stats = StatsData()
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
                            
                            ForEach(0..<stats.results.count/3, id: \.self) { row in // create number of rows
                                HStack (spacing: 30) {
                                    ForEach(0..<3) { column in // create 3 columns
                                        HStack {
                                            VStack (spacing: 10) {
                                                Text("\(stats.names[row * 3 + column])")
                                                    .bold()
                                                    .font(.title3)
                                                    .foregroundColor(Color(UIColor.systemGray))
                                                Text("\(stats.results[row * 3 + column])")
                                                    .bold()
                                                    .foregroundColor(stats.colors[row * 3 + column])
                                                if row == 0 {
                                                    Text("\(stats.subResults.count != 0 && stats.subResults[column] >= 0 ? "+" : "")\(stats.subResults[column])")
                                                        .bold()
                                                        .font(.subheadline)
                                                        .foregroundColor(stats.colors[column])
                                                        .opacity(0.6)
                                                }
                                            }
                                        }.padding(.trailing, row == 0 ? 0 : (column < 2 ? 20 : 15))
                                    }
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
                        
                        let result = results[0]
                        
                        stats.results.append(result.TotalCases)
                        stats.subResults.append(result.NewCases)
                        
                        stats.results.append(Int(result.TotalRecovered) ?? 0)
                        stats.subResults.append(result.NewRecovered)
                        
                        stats.results.append(result.TotalDeaths)
                        stats.subResults.append(result.NewDeaths)
                        
                        stats.results.append(result.ActiveCases)
                        stats.results.append(result.Serious_Critical)
                        stats.results.append(Int(result.TotalTests) ?? 0)
                    }
                    ViewModel().getWorldHistory() { (results) in
                        print("APPENDED \(results.cases)")
                    }
                }
                
            } else {
                //                ListView(text: $text, isEditing: $isEditing)
            }
            
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(text: "")
//    }
//}
