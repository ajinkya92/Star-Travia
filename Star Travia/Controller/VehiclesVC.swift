//
//  VehiclesVC.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 19/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengerLbl: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var person: Person!
    let api = VehicleApi.instance
    var vehicles = [String]()
    var currentVehicle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vehicles = person.vehicleUrls
        nextButton.isEnabled = vehicles.count > 1
        previousButton.isEnabled = false
        guard let firstVehicle = vehicles.first else {return}
        getVehicle(url: firstVehicle)
        
        
    }
    
    func getVehicle(url: String) {
        
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                
                self.setupView(vehicle: vehicle)
            }
            
        }
    }
    
    func setupView(vehicle: Vehicle) {
        
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        manufacturerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengerLbl.text = vehicle.passengers
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentVehicle += 1
        setButtonState()
    }
    
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        currentVehicle -= 1
        setButtonState()
    }
    
    func setButtonState() {
        
        nextButton.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousButton.isEnabled = currentVehicle == 0 ? false : true
        
//        if currentVehicle == 0 {
//            previousButton.isEnabled = false
//        } else {
//            previousButton.isEnabled = true
//        }
//
//        if currentVehicle == vehicles.count - 1 {
//            nextButton.isEnabled = false
//        } else {
//            nextButton.isEnabled = true
//        }
        
        getVehicle(url: vehicles[currentVehicle])
        
        
    }
    
}
