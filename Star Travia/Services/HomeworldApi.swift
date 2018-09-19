//
//  HomeworldApi.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 19/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation
import Alamofire

class HomeworldApi {
    
    static let instance = HomeworldApi()
    
    func getHomeworld(url: String, completion: @escaping homeworldResponseCompletion) {

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
                let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
                completion(homeworld)
            } catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
    
}
