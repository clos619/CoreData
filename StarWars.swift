//
//  StarWars.swift
//  StarWarsCharacters
//
//  Created by Field Employee on 12/18/20.
//

import Foundation


struct SWResults: Decodable{
    let results : [StarWarsCharacter]
    
    enum CodingKeys : String, CodingKey{
        case results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decodeIfPresent([StarWarsCharacter].self, forKey: .results)!
    }
}

struct StarWarsCharacter : Decodable{
    let name : String
    let eyeColor: String
    let hairColor: String

    enum CodingKeys : String, CodingKey{
        case name
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.hairColor = try container.decode(String.self, forKey: .hairColor)
    }
}
