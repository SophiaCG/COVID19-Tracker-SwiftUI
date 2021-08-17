//
//  LineChart.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/14/21.
//

import SwiftUI
import Charts

struct LineChart : UIViewRepresentable {
    //Bar chart accepts data as array of BarChartDataEntry objects
    var entries : [ChartDataEntry]
    
    // this func is required to conform to UIViewRepresentable protocol
    func makeUIView(context: Context) -> LineChartView {
        //crate new chart
        let chart = LineChartView()
        //it is convenient to form chart data in a separate func
        chart.data = addData()
        chart.xAxis.drawGridLinesEnabled = false
        chart.rightAxis.enabled = false
        chart.xAxis.labelPosition = .bottom
        chart.legend.enabled = true
        
        
        return chart
    }
    
    // this func is required to conform to UIViewRepresentable protocol
    func updateUIView(_ uiView: LineChartView, context: Context) {
        //when data changes chartd.data update is required
        uiView.data = addData()
    }
    
    func addData() -> LineChartData{
        let data = LineChartData()
        //BarChartDataSet is an object that contains information about your data, styling and more
        let dataSet = LineChartDataSet(entries: entries)
        // change bars color to green
        dataSet.colors = [NSUIColor.green]
        //change data label
        dataSet.label = "Line Data"
        dataSet.mode = .cubicBezier
        dataSet.cubicIntensity = 0.1
        dataSet.drawCirclesEnabled = false
        dataSet.drawCircleHoleEnabled = false
        
        data.append(dataSet)
        return data
    }
    
    typealias UIViewType = LineChartView
    
}
