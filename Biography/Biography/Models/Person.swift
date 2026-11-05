//
//  Person.swift
//  Biography
//
//  Created by Bandisile Mazomba on 2026/11/05.
//

import Foundation

struct Person: Identifiable, Decodable {
    
    var id: String {name}
    
    //var sections: [persons]
    var imageName: String
    var name: String
    var description: String
    var shortDescription: String
}

struct persons: Decodable, Identifiable {
    var id: String {name}
    
    var name: String
    var PicturesImageName: [String]
}

extension Person: Equatable {
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
    
}

extension Person {
    static var stubbed: [Person] {
        let url = Bundle.main.url(forResource: "biography_list", withExtension: "json")!
        let data = try! Data(contentsOf:url)
        let people = try! JSONDecoder().decode([Person].self, from: data)
        return people
    }
}


