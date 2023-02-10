//
//  PokedexView.swift
//  Pokedex
//
//  Created by Consultant on 1/24/23.
//

import SwiftUI

struct PokedexView: View {
    @State var searchText = ""
    @ObservedObject var pokedexViewModel: PokedexViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach (pokedexViewModel.pokeRecio) { pokemon in
                    HStack {
                        
                        PokemonImage(imageLink: "\(pokemon.url)") // pokemon image
                            .padding(.trailing, 10)
                        NavigationLink("\(pokemon.name)".capitalized,
                                       destination: PokedexNavView(pokemon: pokemon))
                        Text("\(pokemon.details?.types[0].type.name ?? "type")".capitalized)
                    }
                }
                if pokedexViewModel.pokeRecio.count == 150 {
                    Text("No more pokemons")
                } else {
                    NavigationLink(destination: EmptyView()) {
                        Text("Load next 30 pokemons")
                    }
                    .onTapGesture {
                        pokedexViewModel.fetchNext30Pokemon()
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("PokedexUI")
    }
}


struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView(pokedexViewModel: PokedexViewModel.mock())
    }
}


