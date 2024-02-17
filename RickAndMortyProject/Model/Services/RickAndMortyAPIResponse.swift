//
//  RickAndMortyAPIResponse.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 15.02.2024.
//

import Foundation

struct CharactersAPIResponse: Codable {
    let info: CharacterInfo
    let results: [Character]
}

struct CharacterInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: CharacterOrigin
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct CharacterOrigin: Codable {
    let name: String
    let url: String
}

struct CharacterLocation: Codable {
    let name: String
    let url: String
}

struct SingleEpisodeAPIResponse: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
