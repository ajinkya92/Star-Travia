//
//  VehicleApi.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 19/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation
import Alamofire

class VehicleApi {
    
    static let instance = VehicleApi()
    
    func getVehicle(url: String, completion: @escaping vehicleResponseCompletion) {
        
        guard let url = URL(string: url) else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else {return completion(nil)}
            
            let jsonDecoder = JSONDecoder()
            do{
                let vehicle = try jsonDecoder.decode(Vehicle.self, from: data)
                completion(vehicle)
            } catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
    
}
