//
//  Category.swift
//  AppPets
//
//  Created by Moises on 7/18/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import Foundation

struct Category {
    var id: Int
    var name: String
    
    init(json: [String: Any]) throws{
        guard let id = json["id"] as? Int else{ throw SerializationError.missing("Category ID is missing") }
        
        guard let name = json["name"] as? String else { throw SerializationError.missing("Category name is misssing") }
        self.id = id
        self.name = name
    }
}
