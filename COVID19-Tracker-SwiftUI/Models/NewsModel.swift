//
//  NewsModel.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/14/21.
//

import Foundation

struct NewsResults: Codable {
    var news: [News]
}

struct News: Codable {
    var title: String
    var link: String
    var urlToImage: String
    var imageInLocalStorage: String
    var pubDate: String
    var content: String
}
