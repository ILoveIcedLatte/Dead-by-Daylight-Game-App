//
//  Network.swift
//  AppForDBD
//
//  Created by Dilara Şimşek on 14.04.2022.
//

import Foundation
import Alamofire

struct Icon: Codable {
    var portrait: String
    var preview_portrait: String
    var shop_background: String
}


struct Survivor: Codable {
    var _id : String
    var name: String
    var full_name: String
    var gender: String
    var role: String
    var nationality: String
    var overview: String
    var difficulty: String
    var icon: Icon
    var perks: [String]
}


struct IconKiller: Codable {
    var portrait: String
    var preview_portrait: String
    var shop_background: String
}


struct Killer: Codable {
    var _id: String
    var name: String
    var full_name: String
    var gender: String
    var nationality: String
    var overview: String
    var difficulty: String
    var icon: IconKiller
    var perks: [String]
}


struct Perks: Codable {
    var _id: String
    var role: String
    var name: String
    var perk_name: String
    var description: String
    var icon: String
    
}

public class Network {
    
    static func sendRequest(_ url: String, completionHandler: @escaping ([Survivor]) -> ()) {
        
        AF.request(url, method: .get).responseJSON { (response) in

            switch response.result {
            case .success(let data):

                do {

                    let response_detail = try JSONDecoder().decode([Survivor].self, from: response.data!)
                    
                    completionHandler(response_detail)
                    
                }
                catch {print(error)}

            case .failure(let error):
                print (error)
            }
        }
        
    }
    
    
    static func sendRequestKiller(_ url: String, completionHandler: @escaping ([Killer]) -> ()) {
        
        AF.request(url, method: .get).responseJSON { (response) in

            switch response.result {
            case .success(let data):

                do {

                    let response_detail = try JSONDecoder().decode([Killer].self, from: response.data!)
                    
                    completionHandler(response_detail)
                    
                }
                catch {print(error)}

            case .failure(let error):
                print (error)
            }
        }
        
    }
    
    
    static func sendRequestPerks(_ url: String, completionHandler: @escaping ([Perks]) -> ()) {
        
        AF.request(url, method: .get).responseJSON { (response) in

            switch response.result {
            case .success(let data):

                do {

                    let response_detail = try JSONDecoder().decode([Perks].self, from: response.data!)
                    
                    completionHandler(response_detail)
                    
                }
                catch {print(error)}

            case .failure(let error):
                print (error)
            }
        }
        
    }

    
    

    
    
}







