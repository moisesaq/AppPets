//
//  SerializationError.swift
//  AppPets
//
//  Created by Moises on 7/18/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}
