//
//  user.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 02/04/2023.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
    let zipCode: String
    
    enum CodingKeys: String, CodingKey {
        case street = "streetAddress"
        case city
        case zipCode = "zipcode"
    }
}



