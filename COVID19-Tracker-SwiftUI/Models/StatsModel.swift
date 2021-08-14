//
//  StatsModel.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//

import Foundation

//MARK: - Statistics from every country

struct CountryResults: Codable {
    var country: String
    var countryInfo: CountryInfo
    var cases: Int
    var todayCases: Int
    var deaths: Int
    var todayDeaths: Int
    var recovered: Int
    var todayRecovered: Int
    var active: Int
    var critical: Int
    var tests: Int
    var population: Int
    var continent: String
}

struct CountryInfo: Codable {
    var iso2: String
    var iso3: String
    var lat: Int
    var long: Int
    var flag: String
}

//MARK: - Statistics from every state

struct StateResults: Codable {
    var state: String
    var updated: Int
    var cases: Int
    var todayCases: Int
    var deaths: Int
    var todayDeaths: Int
    var recovered: Int
    var active: Int
    var tests: Int
    var population: Int
}

//MARK: - Historical data for the world

struct WorldHistorical: Codable {
    var cases: [String: Int]
    var deaths: [String: Int]
    var recovered: [String: Int]
}

//MARK: - Historical data for every country

struct CountryHistorical: Codable {
    var country: String
    var timeline: Cases
}

struct Cases: Codable {
    var cases: [String: Int]
}
