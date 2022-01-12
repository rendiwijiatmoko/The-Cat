//
//  CatBreed.swift
//  TheCat
//
//  Created by Rendi Wijiatmoko on 12/01/22.
//

import Foundation

struct Breed: Codable, CustomStringConvertible{
    let id: String
    let name: String
    let temperament: String
    let breedExplanation: String
    let image: BreedImage?
    
    var description: String {
        return "breed with name \(name) and id \(id)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplanation = "description"
        case image
    }
}
