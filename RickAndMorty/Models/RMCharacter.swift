//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 21.11.2024.
//

import Foundation

struct RMCharacter : Codable, Identifiable {
    let id : Int
    let name : String
    let status : RMCharacterStatus
    let species : String
    let type : String
    let gender : RMCharacterGender
    let origin : RMOrigin
    let location : RMSingleLocation
    let image : String
    let episode : [String]
    let url : String
    let created : String
}

struct AllCharacters : Codable {
    let results : [RMCharacter]
}

var characterOne = RMCharacter(id: 23, name: "Arcade Alien", status: RMCharacterStatus(rawValue: "unknown") ?? .unknown, species: "Alien", type: "", gender: RMCharacterGender(rawValue: "male") ?? .unknown, origin: RMOrigin(name: "unknown", url: ""), location: RMSingleLocation(name: "Immortality Field Resort", url: "https://rickandmortyapi.com/api/location/7"), image: "https://rickandmortyapi.com/api/character/avatar/23.jpeg", episode: [
    "https://rickandmortyapi.com/api/episode/13",
    "https://rickandmortyapi.com/api/episode/19",
    "https://rickandmortyapi.com/api/episode/21",
    "https://rickandmortyapi.com/api/episode/25",
    "https://rickandmortyapi.com/api/episode/26"
  ], url: "https://rickandmortyapi.com/api/character/23", created: "2017-11-05T08:43:05.095Z")
