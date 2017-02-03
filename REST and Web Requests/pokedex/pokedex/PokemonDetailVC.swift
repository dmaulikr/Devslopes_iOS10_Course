//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Jeffrey Eng on 2/3/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    // Create reference for the Pokemon object that is being passed from MainVC to PokemonDetailVC via segue.
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name
    }

    
}
