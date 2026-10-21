//
//  PredatorsUntitled.swift
//  ApexPredators
//
//  Created by Ytallo Gadelha on 20/10/26.
//

import Foundation

class Predators {
    
    var apexPredators: [ApexPredatorModel] = []
    
    init() {
        decodeApexPredatorData()
    }

    func decodeApexPredatorData() {
        
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            
            do {
                
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                apexPredators = try decoder.decode([ApexPredatorModel].self, from: data)
                
                
            } catch {
                print("Error decoding JSON data: \(error)")
            }
         }
    }
    
    func search(for searchTerm: String) -> [ApexPredatorModel] {
        
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
        
    }
    
    func sort(by alphabetical: Bool) {
        
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }           
        }
        
    }
    
}
