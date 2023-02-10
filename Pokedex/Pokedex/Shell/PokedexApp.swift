//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Consultant on 1/24/23.
//

import SwiftUI

@main
struct PokedexApp: App {
    
    //avoid @StateObject, will cause scene to reload
     let app = ApplicationController ()

    var body: some Scene {
        WindowGroup {
            RootNavigationView(pokedexViewModel: app.pokedexViewModel)
            
        }
    }
}
