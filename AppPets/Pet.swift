//
//  Pet.swift
//  AppPets
//
//  Created by Moises on 7/15/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import Foundation

struct Pet {
    let id: Int
    let name: String
    let category: Category
    let photos: [String]
    
    init(json: [String: Any]) throws {
        guard let id = json["id"] as? Int else { throw SerializationError.missing("Pet ID is missing") }
        guard let name = json["name"] as? String else { throw SerializationError.missing("Pet name is misssing") }
        
        guard let jsonCategory = json["category"] as? [String: Any] else {
            throw SerializationError.missing("Category is missing")
        }
        
        guard let photos = json["photoUrls"] as? [String] else { throw SerializationError.missing("Pet photos are missing")}
        
        
        self.id = id
        self.name = name
        self.category = try Category(json: jsonCategory)
        self.photos = photos
    }
    
    //METHODS STATIC FOR HTTP REQUEST
    static let baseUrl = "http://petstore.swagger.io/v2/pet/findByStatus?status="
    
    static func testFunction(data: String, completion: @escaping (String) -> ()) {
        completion(data + " Test 1235")
    }
    
    static func findPetsByStatus(status: String?, completion: @escaping ([Pet]) -> ()) {
        guard let status = status else{
            print("Status is nil")
            return
        }
        
        let textUrl = baseUrl + status
        guard let url = URL(string: textUrl)  else { return }
        
        var request = URLRequest(url: url)
         request.httpMethod = "GET"
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var result: [Pet] = []
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let response = response{
                print(response)
            }
            
            if let data = data{
                print(data)
                do{
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]{
                        for test in jsonArray{
                            if let name = try? Pet(json: test){
                                result.append(name)
                            }
                        }
                    }
                    
                }catch{
                    print(error)
                }
                
                completion(result)
            }
            
        }
        task.resume()
    }
}
