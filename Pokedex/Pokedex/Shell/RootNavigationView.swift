//
//  RootNavigationView.swift
//  Pokedex
//
//  Created by Consultant on 1/24/23.
//

import SwiftUI

struct RootNavigationView: View {
   
    @ObservedObject var pokedexViewModel: PokedexViewModel
    var body: some View{
        NavigationStack(path: $pokedexViewModel.navigationPath) {
            PokedexView(pokedexViewModel: pokedexViewModel)
        }
    }
}

 
