//
//  ViewModel.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    var country = ""

    let apiKey = "API-KEY-HERE"
    
//MARK: - Language List API Call
    func getResults(completion:@escaping ([Results]) -> ()) {
        
        guard let url = URL(string: "https://corona.lmao.ninja/v2/countries") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {
                print("TASK ERROR 1: \(String(describing: error))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode([Results].self, from: data!)
                
                DispatchQueue.main.async {
                    self.country = results[0].country
                    print("RESULT: \(self.country)")
                    completion(results)
                }
            } catch {
                print("RESULTS ERROR 1: \(error)")
            }
        }
        task.resume()
    }
}
