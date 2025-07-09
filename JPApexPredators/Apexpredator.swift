//
//  Apexpredator.swift
//  JPApexPredators
//
//  Created by Dhaval Bhadania on 09/07/25.
//

import Foundation
import SwiftUI

struct Apexpredator: Decodable , Identifiable{
    let id : Int
    let name: String
    let type : APType
    let latitude : Double
    let longitude : Double
    let movies : [String]
    let movieScenes :[MovieScene]
    let link : String
    
    var image: String{
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    
    struct MovieScene:Decodable{
        let id :Int
        let movie : String
        let sceneDescription : String
    }
    
    
}

enum APType: String, Decodable, Identifiable, CaseIterable{
    var id: APType{
        self
    }
    
    case all
    case land // "land"
    case air
    case sea

    var background : Color{
        switch self {
        case .land:
            .brown
        case .air:
            .teal
        case .sea:
            .blue
        case .all:
                .black
        }
    }
    
    var icon: String{
        
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
}
