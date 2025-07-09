//
//  Predators.swift
//  JPApexPredators
//
//  Created by Dhaval Bhadania on 09/07/25.
//

import Foundation

class Predators{
    var allApexPredators : [Apexpredator] = []

    var apexPredators : [Apexpredator] = []

    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: ".json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([Apexpredator].self, from: data)
                apexPredators = allApexPredators
            }catch{
                print("Error Decoding json data : \(error)")
            }
        }
    }
    
    
    func search(for searchTerm: String) -> [Apexpredator]{
        if searchTerm.isEmpty {
            return apexPredators
        }
        else{
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabatical: Bool){
        apexPredators.sort { predator1, predator2 in
            if alphabatical{
                predator1.name < predator2.name
            }
            else{
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: APType){
        if type == .all {
            apexPredators = allApexPredators
        }
        else{
//            self.decodeApexPredatorData()
            apexPredators = allApexPredators.filter { predator in
                predator.type ==  type
            }
        }
        
    }
    
   
}
