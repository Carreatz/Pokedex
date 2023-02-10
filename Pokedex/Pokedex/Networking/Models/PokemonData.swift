//
//  PokemonData.swift
//  Pokedex
//
//  Created by Consultant on 1/29/23.
//

import Foundation

// MARK: - Welcome
struct PokemonData: Codable {
    let id: Int
    let types: [TypeElement]
    let weight: Int
    let abilities: [Ability]
    let moves: [Move]

    enum CodingKeys: String, CodingKey {
        case id
        case types, weight, abilities, moves
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: Species
}

struct Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

struct Move: Codable {
    let move: Species

    enum CodingKeys: String, CodingKey {
        case move
    }
}
