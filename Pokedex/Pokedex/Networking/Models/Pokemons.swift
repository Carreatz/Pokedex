//
//  Pokemons.swift
//  Pokedex
//
//  Created by Consultant on 1/24/23.
//

import Foundation

struct Pokemons: Decodable {
    var results: [PokemonEntry]
    var next: String
    
}

class PokemonEntry: Decodable, Identifiable, Equatable, ObservableObject {
    static func == (lhs: PokemonEntry, rhs: PokemonEntry) -> Bool {
        return lhs.name == rhs.name
    }
    //hacerlo clase
    var id: String{
        return name
    }
    var name: String
    var url: String
//    var pokemonTypes: [String]? //excluir para no ser buscada en el json
    var details: PokemonData? // we added this
}


class PokeApi {
    var next: String = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=30"
    func getData(completion: @escaping (([PokemonEntry]) -> ())) {
        guard let url = URL(string: next) else { //creando a la URL que se llama
            return
        }
        URLSession.shared.dataTask(with: url) {(data, response, error) in //se llama la url
            guard let data = data else {return} //regresa la respuesta 'data'
            
            let pokemonList = try! JSONDecoder().decode(Pokemons.self, from: data) //transaformando respuesta 'que es un json' en un objeto pokemon
            self.next = pokemonList.next
            let dispatchGroup = DispatchGroup()
            print(pokemonList.results.first?.name)
            print(pokemonList.next)
            
            for pokemon in pokemonList.results {
                dispatchGroup.enter()
                self.getPokemonInfo(pokemon: pokemon) { result in
                    dispatchGroup.leave()
                    pokemon.details = result //added this
                    print(pokemonList.results[0])
                }
            }
            dispatchGroup.notify(queue: .main) {
                completion(pokemonList.results)
            }
        }.resume() 
    }
    func getPokemonInfo(pokemon: PokemonEntry, completion: @escaping ((PokemonData?) -> ())) {
        guard let url = URL(string: pokemon.url) else {
            return
        }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {return}
            
            do {
                
                let pokemonInfo = try JSONDecoder().decode(PokemonData.self, from: data)
                completion(pokemonInfo)
            }
            catch {
                print("Error decoding JSON \(error)")
                completion(nil)
            }
        }.resume()
    }
}

 
