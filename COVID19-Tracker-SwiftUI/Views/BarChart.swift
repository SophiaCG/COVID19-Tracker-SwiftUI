//
//  BarChart.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/14/21.
//

import SwiftUI
import Charts

struct BarChart : UIViewRepresentable {
    //Bar chart accepts data as array of BarChartDataEntry objects
    var entries : [BarChartDataEntry]
    // this func is required to conform to UIViewRepresentable protocol
    func makeUIView(context: Context) -> BarChartView {
        //crate new chart
        let chart = BarChartView()
        //it is convenient to form chart data in a separate func
        chart.data = addData()
        chart.xAxis.drawGridLinesEnabled = false
        chart.rightAxis.enabled = false
        chart.xAxis.labelPosition = .bottom
        chart.legend.enabled = false
        return chart
    }
    
    // this func is required to conform to UIViewRepresentable protocol
    func updateUIView(_ uiView: BarChartView, context: Context) {
        //when data changes chartd.data update is required
        uiView.data = addData()
    }
    
    func addData() -> BarChartData{
        let data = BarChartData()
        //BarChartDataSet is an object that contains information about your data, styling and more
        let dataSet = BarChartDataSet(entries: entries)
        // change bars color to green
        dataSet.colors = [NSUIColor.green]
        //change data label
        dataSet.label = "Bar Data"
        data.append(dataSet)
        return data
    }
    
    typealias UIViewType = BarChartView
    
}
