//
//  StarshipApi.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 20/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation
import Alamofire

class StarshipApi {
    
    static let instance = StarshipApi()
    
    func getStarship(url: String, completion: @escaping starshipResponseCompletion) {
        
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
                let starship = try jsonDecoder.decode(Starship.self, from: data)
                completion(starship)
            } catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
        
    }
    
}
