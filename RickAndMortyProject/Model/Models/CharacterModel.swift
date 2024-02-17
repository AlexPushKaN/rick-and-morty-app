//
//  Character.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 16.02.2024.
//

import Foundation

struct CharacterModel {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let placeOfBirth: String
    let location: String
    let image: Data
    var episode: [String]
    let created: String
}
