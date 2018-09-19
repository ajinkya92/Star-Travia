//
//  StarShipsVC.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 19/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class StarShipsVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var capacityLbl: UILabel!
    @IBOutlet weak var consumablesLbl: UILabel!
    @IBOutlet weak var ratingsLbl: UILabel!
    @IBOutlet weak var starshipClassLbl: UILabel!
    
    @IBOutlet weak var nextButton: FadeEnabledButton!
    @IBOutlet weak var previousButton: FadeEnabledButton!
    
    var person: Person!
    let api = StarshipApi.instance
    var starships = [String]()
    var currentStarship = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        starships = person.starshipUrls
        nextButton.isEnabled = starships.count > 1
        previousButton.isEnabled = false
        guard let firstUrl = starships.first else {return}
        getStarshipUrl(url: firstUrl)
        
        
    }
    
    func getStarshipUrl(url: String) {
        
        api.getStarship(url: url) { (starship) in
            
            if let starship = starship {
                
                self.setupView(starship: starship)
            }
        }
        
    }
    
    
    func setupView(starship: Starship) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        manufacturerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        capacityLbl.text = starship.capacity
        consumablesLbl.text = starship.consumables
        ratingsLbl.text = starship.rating
        starshipClassLbl.text = starship.starshipClass
        
    }
    
    
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentStarship += 1
        setButtonState()
    }
    
    @IBAction func previousButton(_ sender: UIButton) {
        currentStarship -= 1
        setButtonState()
    }
    
    func setButtonState() {
        nextButton.isEnabled = currentStarship == starships.count - 1 ? false : true
        previousButton.isEnabled = currentStarship == 0 ? false : true
        
        getStarshipUrl(url: starships[currentStarship])
        
    }
    
}
