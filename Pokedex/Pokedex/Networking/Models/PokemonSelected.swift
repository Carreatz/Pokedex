//
//  PokemonSelected.swift
//  Pokedex
//
//  Created by Consultant on 1/24/23.
//

import Foundation

struct PokemonSelected: Decodable {
    var sprites: PokemonSprites
}
	
struct PokemonSprites: Decodable {
    var front_default: String
    
}

class PokemonSelectedApi {
    func getData(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {return}
            
            let pokemonSprites = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprites.sprites)
            }
        }.resume()
    }
}
