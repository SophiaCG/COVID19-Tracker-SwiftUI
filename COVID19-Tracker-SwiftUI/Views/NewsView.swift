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

            
            VStack (spacing: 30) {
                ForEach(news.indices, id: \.self) { index in
                    ZStack {
                        RemoteImage(url: news[index].urlToImage)
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.4)
                            .cornerRadius(30)
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom))
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.4)
                            .cornerRadius(30)
                        VStack {
                            Spacer()
                            Text(news[index].title)
                                .bold()
                                .foregroundColor(.white)
                                .font(.title)
                            Text(news[index].content)
                                .bold()
                                .foregroundColor(.white)
                                .font(.title3)
                                .lineLimit(2)

                        }
                        .frame(width: UIScreen.main.bounds.width * 0.85)
                        .padding(.bottom, 15)

                    }
                    .shadow(radius: 5)
                }
            }.padding(.top, 10)
        }
        .background(Color(UIColor.systemGray5))
        .ignoresSafeArea()
        .onAppear() {
            ViewModel().getNews { (results) in
                for article in results.news {
                    news.append(article)
                }
            }
        }
    }
}
