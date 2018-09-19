//
//  HomeWorldVC.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 19/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class HomeWorldVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var person: Person!
    let api = HomeworldApi.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.getHomeworld(url: person.homeworldurl) { (homeworld) in
            
            if let homeworld = homeworld {
                self.setupUi(homeworld: homeworld)
            }
        }
        
    }
    
    
    func setupUi(homeworld: Homeworld) {
        
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
    

}
