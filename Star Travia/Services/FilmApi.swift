//
//  FilmApi.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 20/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation
import Alamofire

class FilmApi {
    
    static let instance = FilmApi()
    
    func getFilms(url: String, completion: @escaping filmResponseCompletion) {
        
        guard let url = URL(string: url) else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let error = response.result.error {
                completion(nil)
                debugPrint(error.localizedDescription)
                return
            }
            
            guard let data = response.data else {return completion(nil)}
            
            let jsonDecoder = JSONDecoder()
            do{
                
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            } catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
        
        
    }
    
    
}
