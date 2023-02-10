//
//  ApplicationController.swift
//  Pokedex
//
//  Created by Consultant on 1/24/23.
//

import Foundation

class ApplicationController {
    
    static func mock() -> ApplicationController {
        ApplicationController() 
    }
    
    lazy var pokedexViewModel: PokedexViewModel = {
        PokedexViewModel(app: self)
    } ()
    
}
