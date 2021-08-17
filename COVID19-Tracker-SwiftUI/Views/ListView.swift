//
//  ListView.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/16/21.
//
import Foundation
import SwiftUI

struct ListView: View {
    
    @Binding var countriesList: [CountriesList]
    @Binding var text: String
    @Binding var isEditing: Bool
    
    let screen = UIScreen.main.bounds

    var body: some View {
        
        VStack {
            
//MARK: - List of Available Languages
            ScrollView {
                ForEach(countriesList.indices, id: \.self) { index in
                    HStack {
                        Button(action: {

                            print(countriesList[index].Country)
                            self.text = countriesList[index].Country
                            
                            // Dismisses modal sheet
                            self.isEditing = false
                        }, label: {
                            Text(countriesList[index].Country)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.leading, 30)
                            Spacer()
                        })
                        .frame(width: screen.width, height: screen.height * 0.07, alignment: .center)
                        .border(Color.gray, width: 0.23)
                        
                    }
                    
                } .onAppear() {
                    // Calls API in getLanguages to get a list of available languages
                    ViewModel().getList { results in
                        for country in results {
                            countriesList.append(country)
                        }
                    }
                }
            }
        }
    }
}
