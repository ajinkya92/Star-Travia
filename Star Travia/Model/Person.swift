//
//  Person.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 18/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

struct Person: Codable {
    
    let name: String
    let height: String
    let mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeworldurl: String
    let filmUrls: [String]
    let vehicleUrls: [String]
    let starshipUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworldurl = "homeworld"
        case filmUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
    }
    
    
    init(name: String, height: String, mass: String, hair: String, birthYear: String, gender: String, homeworldUrl: String, filmUrls: [String], vehicleUrls: [String], starshipUrls: [String]) {

        self.name = name
        self.height = height
        self.mass = mass
        self.hair = hair
        self.birthYear = birthYear
        self.gender = gender
        self.homeworldurl = homeworldUrl
        self.filmUrls = filmUrls
        self.vehicleUrls = vehicleUrls
        self.starshipUrls = starshipUrls


        
    }
    
}
