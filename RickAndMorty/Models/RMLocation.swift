//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 21.11.2024.
//

import Foundation

struct RMLocation : Codable, Identifiable {
    let id : Int
    let name : String
    let type : String
    let dimension : String
    let residents : [String]
    let url : String
    let created : String
}

struct AllLocations : Codable {
    let results : [RMLocation]
}
