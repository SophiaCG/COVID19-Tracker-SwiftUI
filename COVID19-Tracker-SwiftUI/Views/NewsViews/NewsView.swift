//
//  NewsView.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/16/21.
//

import Foundation
import SwiftUI

struct NewsView: View {
    
    @State var news: [News] = []
    
    var body: some View {

        ScrollView {
            
            ZStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.13)
                    .foregroundColor(.red)
                    .ignoresSafeArea()
                HStack {
                    Text("Coronavirus News")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    Spacer()
                }.padding(.top, 20)
            }

            
            VStack (alignment: .leading, spacing: 13) {
                ForEach(news.indices, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.15)
                            .foregroundColor(.white)
                            .cornerRadius(17)
                            .shadow(radius: 3)

                        HStack(alignment: .center, spacing: 15) {
                            
                            RemoteImage(url: news[index].urlToImage)
                                .frame(width: 120, height: 100)
                                .cornerRadius(10)

                            Text(news[index].title)
                                .bold()
                                .foregroundColor(.black)
                                .lineLimit(3)

                        }.frame(width: UIScreen.main.bounds.width * 0.9)
                    }
                }
            }
        }
        .background(Color(UIColor.systemGray5))
        .ignoresSafeArea()
        .onAppear() {
            WebViewModel().getNews { (results) in
                for article in results.news {
                    news.append(article)
                }
            }
        }
    }
}
