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
//    @State var countriesList: [CountriesList] = []
//    @Binding var text: String
//    @Binding var isEditing: Bool
//    
//    let screen = UIScreen.main.bounds
//
//    var body: some View {
//        
////        let filtered = countriesList.filter { country in
////            return text.isEmpty ? true : country.Country.lowercased().contains(text.lowercased())
////        }
//        
//        VStack {
//            
////MARK: - List of Available Languages
////            ScrollView {
//            List {
//                ForEach(countriesList.filter { $0.Country.contains(text) || text.isEmpty }) { stat in
//
//                Text("\(String(describing: countriesList))")
////                ForEach(filtered.indices, id: \.self) { index in
////                    HStack {
////                        Button(action: {
////
////                            print(item.Country)
////                            self.text = item.Country
////
////                            // Dismisses modal sheet
////                            self.isEditing = false
////                        }, label: {
////                            Text(item.Country)
////                                .bold()
////                                .foregroundColor(.black)
////                                .padding(.leading, 30)
////                            Spacer()
////                        })
////                        .frame(width: screen.width, height: screen.height * 0.07, alignment: .center)
////                        .border(Color.gray, width: 0.23)
////
////                    }
//                    
//                } .onAppear() {
//                    // Calls API in getLanguages to get a list of available languages
//                    ViewModel().getList { results in
//                        for country in results {
//                            countriesList.append(country)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
