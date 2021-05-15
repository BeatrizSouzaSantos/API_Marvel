//
//  Characters.swift
//  APIMarvel
//
//  Created by vinicius de souza santos on 15/05/21.
//

import UIKit

struct MarvelAPIData: Codable {
    var data: CharacterData
}


struct CharacterData: Codable {
    let results: [Character]
}


struct Character: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail

}


struct Thumbnail: Codable {
    let path: String
    let ext: String


    var url: String{
        return path + "." + ext
    }

}
