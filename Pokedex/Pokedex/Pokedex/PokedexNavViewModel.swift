//
//  PokedexNavViewModel.swift
//  Pokedex
//
//  Created by Consultant on 2/3/23.
//

import SwiftUI

class PokedexNavViewModel: ObservableObject {
    
    static func mock() -> PokedexNavViewModel {
        PokedexNavViewModel(app: ApplicationController.mock())
    }
    @Published var pokeDuro = [PokemonEntry]()
    
    let app: ApplicationController
    init(app: ApplicationController) {
        self.app = app
    }
    func pokemonT() {
        PokeApi().getData() { result in
            
            self.pokeDuro = result
        }
    }
}
