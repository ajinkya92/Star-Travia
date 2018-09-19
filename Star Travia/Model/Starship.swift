//
//  Starship.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 20/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

struct Starship: Codable {
    
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    let capacity: String
    let consumables: String
    let rating: String
    let starshipClass: String
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
        case capacity = "cargo_capacity"
        case consumables
        case rating = "hyperdrive_rating"
        case starshipClass = "starship_class"
    }
    
}
