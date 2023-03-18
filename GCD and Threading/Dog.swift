//
//  Dog.swift
//  ThreadingAndGCD
//
//  Created by Stewart Lynch on 2020-06-09.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Swift

//model
struct Dog: Codable {
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "message"
    }
}


