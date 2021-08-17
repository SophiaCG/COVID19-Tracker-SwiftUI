//
//  PieChart.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/14/21.
//

import SwiftUI
import Charts

struct PieChart : UIViewRepresentable {
    //Bar chart accepts data as array of BarChartDataEntry objects
    var entries : [ChartDataEntry]
    
    // this func is required to conform to UIViewRepresentable protocol
    func makeUIView(context: Context) -> PieChartView {
        //crate new chart
        let chart = PieChartView()
        //it is convenient to form chart data in a separate func
        chart.data = addData()
        chart.legend.enabled = true
        
        
        return chart
    }
    
    // this func is required to conform to UIViewRepresentable protocol
    func updateUIView(_ uiView: PieChartView, context: Context) {
        //when data changes chartd.data update is required
        uiView.data = addData()
    }
    
    func addData() -> PieChartData{
        let data = PieChartData()
        //BarChartDataSet is an object that contains information about your data, styling and more
        let dataSet = PieChartDataSet(entries: entries)
        // change bars color to green
        dataSet.colors = [.green, .purple]
        //change data label
        dataSet.label = "Pie Data"
        dataSet.valueTextColor = .black
        data.append(dataSet)
        return data
    }
    
    typealias UIViewType = PieChartView
    
}
