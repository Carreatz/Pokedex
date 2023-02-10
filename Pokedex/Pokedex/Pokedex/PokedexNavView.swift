//
//  PokedexNavView.swift
//  Pokedex
//
//  Created by Consultant on 2/7/23.
//

import SwiftUI

struct PokedexNavView: View {
    
    @ObservedObject var pokemon: PokemonEntry
    
    var body: some View {
        VStack {
            Text("\(pokemon.name)".capitalized)
                .bold()
            PokemonImage(imageLink: "\(pokemon.url)")
            Text("Type")
                .foregroundColor(Color.white)
                .font(.system(size: 20.0))
            HStack {
                ForEach (0..<(pokemon.details?.types.count ?? 0), id: \.self) { index in
                    Text("\(pokemon.details?.types[index].type.name ?? "type")".capitalized)
                }
            }
            Text("Abilities")
                .foregroundColor(Color.white)
                .font(.system(size: 20.0))
            HStack {
                ForEach (0..<(pokemon.details?.abilities.count ?? 0), id: \.self) { index in
                    Text("\(pokemon.details?.abilities[index].ability.name ?? "type")".capitalized)
                }
            }
            List {
                Section {
                    ForEach (0..<(pokemon.details?.moves.count ?? 0), id: \.self) { index in
                        Text("\(pokemon.details?.moves[index].move.name ?? "type")".capitalized)
                    }
                } header: {
                    Text("Moveset")
                        .bold()
                }
            }
        }
        .background(Color.red)
    }
}

//struct PokedexNavView_Previews: PreviewProvider {
//    static var previews: some View {
//       PokedexNavView()
//    }
//}
