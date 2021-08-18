//  ViewModel.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//
import Foundation
import SwiftUI

class ViewModel: ObservableObject {
        
//    @Published var result: [StatsResults]?
    @Published var countriesList: [CountriesList] = []
    var apiKey = "API-KEY-HERE"
    
//MARK: -
    func getResults(completion:@escaping ([StatsResults]) -> ()) {
        
        guard let url = URL(string: "https://vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com/api/npm-covid-data/world?rapidapi-key=\(apiKey)") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {
                print("TASK ERROR 1: \(String(describing: error))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode([StatsResults].self, from: data!)
                
                DispatchQueue.main.async {
                    print("RESULT: \(results[0].ActiveCases)")
//                    self.result?.append(results[0])
//                    print("NEW RESULT: \(String(describing: self.result?[0].ActiveCases))")
                    completion(results)
                }
            } catch {
                print("RESULTS ERROR 1: \(error)")
            }
        }
        task.resume()
    }

    func getList(completion:@escaping ([CountriesList]) -> ()) {
        
        guard let url = URL(string: "https://vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com/api/npm-covid-data/countries-name-ordered?rapidapi-key=\(apiKey)") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {
                print("TASK ERROR 2: \(String(describing: error))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode([CountriesList].self, from: data!)
                
                DispatchQueue.main.async {
                    print("RESULT: \(results[0].Country)")
                    for country in results {
                        self.countriesList.append(country)
                    }
                    completion(results)
                }
            } catch {
                print("RESULTS ERROR 2: \(error)")
            }
        }
        task.resume()
    }

    func getWorldHistory(completion:@escaping (WorldHistorical) -> ()) {
        
        guard let url = URL(string: "https://corona.lmao.ninja/v2/historical/all") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {
                print("TASK ERROR 3: \(String(describing: error))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(WorldHistorical.self, from: data!)
                
                DispatchQueue.main.async {
                    print("RESULT: \(results.cases)")
                    completion(results)
                }
            } catch {
                print("RESULTS ERROR 3: \(error)")
            }
        }
        task.resume()
    }
    
    func getCountryHistory(completion:@escaping (CountryHistorical) -> ()) {
        
        guard let url = URL(string: "https://corona.lmao.ninja/v2/historical/Spain?lastdays=30") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {
                print("TASK ERROR 4: \(String(describing: error))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(CountryHistorical.self, from: data!)
                
                DispatchQueue.main.async {
                    print("RESULT: \(results.country)")
                    completion(results)
                }
            } catch {
                print("RESULTS ERROR 4: \(error)")
            }
        }
        task.resume()
    }

}
