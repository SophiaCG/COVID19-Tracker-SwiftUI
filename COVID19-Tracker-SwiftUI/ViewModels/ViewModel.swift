//
//  ViewModel.swift
//  COVID19-Tracker-SwiftUI
//
//  Created by SCG on 8/13/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    let apiKey = "API-KEY-HERE"

//MARK: - Language List API Call
    func getResults(completion:@escaping (WorldResults) -> ()) {
        
        guard let url = URL(string: "https://api.quarantine.country/api/v1/summary/latest") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {
                print("TASK ERROR 1: \(String(describing: error))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(WorldResults.self, from: data!)
                
                DispatchQueue.main.async {
                    print("RESULT: \(results.data.summary.total_cases)")
                    completion(results)
                }
            } catch {
                print("RESULTS ERROR 1: \(error)")
            }
        }
        task.resume()
    }
}
