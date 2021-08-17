//
//  StatsModel.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//
import Foundation

//MARK: - Statistics from every country
struct StatsResults: Codable {
    var Country: String
    var Continent: String
    var ThreeLetterSymbol: String?
    var TotalCases: Int
    var NewCases: Int
    var TotalDeaths: Int
    var NewDeaths: Int
    var TotalRecovered: String
    var NewRecovered: Int
    var ActiveCases: Int
    var TotalTests: String
    var Serious_Critical: Int
}

//MARK: - List of Countries
struct CountriesList: Codable {
    var Country: String
    var ThreeLetterSymbol: String
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
    var timeline: WorldHistorical
}
