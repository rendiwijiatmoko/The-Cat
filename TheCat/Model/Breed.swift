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
    let explanation: String
    let image: BreedImage?
    
    var description: String {
        return "breed with name \(name) and id \(id)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case explanation = "description"
        case image
    }
    
    init(id: String, name: String, temprament: String, explanation: String, image: BreedImage?){
        self.id = id
        self.name = name
        self.temperament = temprament
        self.explanation = explanation
        self.image = image
    }
    
    
    // Preview Helpers
    static func example1() -> Breed {
        let breed = Breed(id: "abys", name: "Abyssinian", temprament: "Active, Energetic, Independent, Intelligent, Gentle", explanation: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", image: nil)
        return breed
    }
}
