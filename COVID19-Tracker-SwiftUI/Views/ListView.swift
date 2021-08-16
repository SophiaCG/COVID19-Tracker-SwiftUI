////
////  ListView.swift
////  COVID19-Tracker-SwiftUI
////
////  Created by SCG on 8/16/21.
////
//
//import Foundation
//import SwiftUI
//
//struct ListView: View {
//    
//    @Binding var searchText: String
//    @Binding var countriesList: [String]
//    
//    var body: some View {
//        
//        List(countriesList.filter({ searchText.isEmpty ? true : $0.lowercased().contains(searchText.lowercased()) })) { item in
//            Button(action: {
//                searchText = "\(item)"
////                latitude = item.latitude
////                longitude = item.longitude
//                
//                // Dismiss the keyboard
//                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//            }) {
//                VStack (alignment: .leading, spacing: 5) {
//                    Text(item.name).font(.headline)
//                    Text(item.address).font(.subheadline)
//                    
//                }
//            }
//        }
//
//    }
//}
