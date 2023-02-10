//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by Consultant on 1/24/23.
//

import SwiftUI
class PokedexViewModel: ObservableObject   {
    var api = PokeApi()
//    crear una variable, para que se haga la instancia
    static func mock() -> PokedexViewModel {
        PokedexViewModel(app: ApplicationController.mock())
    }
      
    @Published var navigationPath = NavigationPath()
    @Published var pokeRecio = [PokemonEntry]()
    
    let app: ApplicationController
    init(app: ApplicationController) {
        self.app = app
    }
    func fetchNext30Pokemon() {
        api.getData() { result in
            self.pokeRecio += result
        }
    }
    func fetchData() {
        api.getData() { result in
            self.pokeRecio = result
        }
    }
}
