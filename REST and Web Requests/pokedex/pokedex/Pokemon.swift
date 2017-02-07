//
//  Pokemon.swift
//  pokedex
//
//  Created by Jeffrey Eng on 1/31/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    // MARK: Private variables
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!
    
    //MARK: Class Properties (Getters)
    var nextEvolutionText: String {
        // Handling if the value is nil
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    var baseAttack: String {
        if _baseAttack == nil {
            _baseAttack = ""
        }
        return _baseAttack
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var name: String {
        return _name.capitalized
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    // MARK: Initializer
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    //MARK: Class methods
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON {(response) in
            // Print results to see if we get a response
            print(response.result.value)
            
            // Optionally unwrap the dictionary that is returned from the GET request
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                // Call the parseJSON method and pass in the dictionary
                self.parseJSON(from: dict)
            }
            completed()
        }
    }
    
    func parseJSON(from pokeDict: Dictionary<String, AnyObject>) {
        if let weight = pokeDict["weight"] as? String {
            //Set the weight property of Pokemon instance to the value of the key 'weight'.
            self._weight = weight
        }
        
        if let height = pokeDict["height"] as? String {
            self._height = height
        }
        
        if let defense = pokeDict["defense"] as? Int {
            self._defense = "\(defense)"
        }
        
        if let baseAttack = pokeDict["attack"] as? Int {
            self._baseAttack = "\(baseAttack)"
        }
        
        print(self._weight)
        print(self._height)
        print(self._baseAttack)
        print(self._defense)
    }
}
