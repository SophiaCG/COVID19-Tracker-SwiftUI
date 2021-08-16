//
//  ContentView.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    @State var totalCases = 206408680
    @State var activeCases = 18928299
    @State var deaths = 4351035
    @State var recovered = 183130738
    @State var critical = 103991
    @State var tested = 2971738655
    
    @State var totalChange = -599915
    @State var activeChange = 129384
    @State var deathsChange = 8942
    @State var recoveredChange = 461933
    @State var criticalChange = 778
    @State var testedChange = 8028395
    
    @State var countriesList: [String] = []
    
    var body: some View {
        
        ScrollView {
//            VStack (spacing: 80) {
//                VStack (spacing: 30) {
//                    HStack {
//                        Text("World Statistics")
//                            .bold()
//                            .font(.title)
//                            .padding(.leading, 12)
//                            .padding(.bottom, -15)
//                        Spacer()
//                    }
//                    HStack (alignment: .center, spacing: 30) {
//                        VStack (spacing: 10) {
//                            Text("Total Cases")
//                                .bold()
//                                .font(.title3)
//                                .foregroundColor(Color(UIColor.systemGray))
//                            Text("\(totalCases)")
//                                .bold()
//                                .foregroundColor(.purple)
//                            Text("\(totalChange > 0 ? "+" : "")\(totalChange)")
//                                .bold()
//                                .font(.subheadline)
//                                .foregroundColor(.purple)
//                                .opacity(0.6)
//                        }
//                        VStack (spacing: 10) {
//                            Text("Active Cases")
//                                .bold()
//                                .font(.title3)
//                                .foregroundColor(Color(UIColor.systemGray))
//                            Text("\(activeCases)")
//                                .bold()
//                                .foregroundColor(.blue)
//                            Text("\(activeChange > 0 ? "+" : "")\(activeChange)")
//                                .bold()
//                                .font(.subheadline)
//                                .foregroundColor(.blue)
//                                .opacity(0.6)
//                        }
//                        VStack (spacing: 10) {
//                            Text("Critical")
//                                .bold()
//                                .font(.title3)
//                                .foregroundColor(Color(UIColor.systemGray))
//                            Text("\(critical)")
//                                .bold()
//                                .foregroundColor(.orange)
//                            Text("\(criticalChange > 0 ? "+" : "")\(criticalChange)")
//                                .bold()
//                                .font(.subheadline)
//                                .foregroundColor(.orange)
//                                .opacity(0.6)
//                        }
//                    }
//
//                    HStack (alignment: .center, spacing: 30) {
//                        VStack (spacing: 10) {
//                            Text("Recovered")
//                                .bold()
//                                .font(.title3)
//                                .foregroundColor(Color(UIColor.systemGray))
//                            Text("\(recovered)")
//                                .bold()
//                                .foregroundColor(.green)
//                            Text("\(recoveredChange > 0 ? "+" : "")\(recoveredChange)")
//                                .bold()
//                                .font(.subheadline)
//                                .foregroundColor(.green)
//                                .opacity(0.6)
//                        }
//                        VStack (spacing: 10) {
//                            Text("Tested")
//                                .bold()
//                                .font(.title3)
//                                .foregroundColor(Color(UIColor.systemGray))
//                            Text("\(tested)")
//                                .bold()
//                                .foregroundColor(.yellow)
//                            Text("\(testedChange > 0 ? "+" : "")\(testedChange)")
//                                .bold()
//                                .font(.subheadline)
//                                .foregroundColor(.yellow)
//                                .opacity(0.6)
//                        }
//                        VStack (spacing: 10) {
//                            Text("Deaths")
//                                .bold()
//                                .font(.title3)
//                                .foregroundColor(Color(UIColor.systemGray))
//                            Text("\(deaths)")
//                                .bold()
//                                .foregroundColor(.red)
//                            Text("\(deathsChange > 0 ? "+" : "")\(deathsChange)")
//                                .bold()
//                                .font(.subheadline)
//                                .foregroundColor(.red)
//                                .opacity(0.6)
//
//                        }
//                    }
//                }
//
//                HStack {
//                    Text("World Statistics")
//                        .bold()
//                        .font(.title)
//                        .padding(.leading, 12)
//                        .padding(.bottom, -40)
//                    Spacer()
//                }
//                BarChart(entries: [
//                    BarChartDataEntry(x: 1, y: 1),
//                    BarChartDataEntry(x: 2, y: 2),
//                    BarChartDataEntry(x: 3, y: 3),
//                    BarChartDataEntry(x: 4, y: 4),
//                    BarChartDataEntry(x: 5, y: 5)
//
//                ]).frame(width: UIScreen.main.bounds.width * 0.9, height: 300, alignment: .center)
//
//                HStack {
//                    Text("World Statistics")
//                        .bold()
//                        .font(.title)
//                        .padding(.leading, 12)
//                        .padding(.bottom, -40)
//                    Spacer()
//                }
//                LineChart(entries: [
//                    ChartDataEntry(x: 1, y: 41),
//                    ChartDataEntry(x: 2, y: 23),
//                    ChartDataEntry(x: 3, y: 34),
//                    ChartDataEntry(x: 4, y: 64),
//                    ChartDataEntry(x: 5, y: 15)
//
//                ]).frame(width: UIScreen.main.bounds.width * 0.9, height: 300, alignment: .center)
//
//                HStack {
//                    Text("World Statistics")
//                        .bold()
//                        .font(.title)
//                        .padding(.leading, 12)
//                        .padding(.bottom, -40)
//                    Spacer()
//                }
//                PieChart(entries: [
//                    ChartDataEntry(x: 1, y: 41),
//                    ChartDataEntry(x: 2, y: 23),
//                    ChartDataEntry(x: 3, y: 34),
//                    ChartDataEntry(x: 4, y: 64),
//                    ChartDataEntry(x: 5, y: 15)
//
//                ]).frame(width: 380, height: 380, alignment: .center)
//            }
            Text("TEST")
            ForEach(countriesList.indices, id: \.self) { index in
                Text("\(countriesList[index])")
            }
        }.onAppear() {
            ViewModel().getResults { (results) in
                for countries in results.data {
                    countriesList.append(countries.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
