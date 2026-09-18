//
//  Country.swift
//  Country_API
//
//  Created by Bandisile Mazomba on 2026/09/04.
//

struct Objects: Decodable {
    
    let capitals: [Capital]
    let continents: [String]
    let currencies: [Currency]
    let borders: [String]
    let flag: Flag
    
}

struct Capital: Decodable{
    let name: String
}

struct Currency: Decodable{
    
    let symbol: String
    let name: String
}

struct Flag: Decodable{
    
    let description: String
    let emoji: String
}

struct CountryData: Decodable{
    let objects: [Objects]
    
}

struct DataObject: Decodable{
    
    let data: CountryData
    
}

















//struct Rooms: Decodable {
//    let roomNumber: Int
//    let guest: Guest
//    let isAvailable: Bool
//    
//    enum CodingKeys: String, CodingKey {
//        case roomNumber
//        case guest = "guesst"
//        case isAvailable = "isAvilable"
//        
//    }
//}
//
//struct Guest: Decodable {
//    let name: String
//    let nationality: String
//    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case nationality = "nationalty"
//        
//    }
//}
//
//struct Address: Decodable{
//    let street: String
//    let city: String
//}
//
//struct Hotel: Decodable {
//    let hotelName: String
//    let address: Address
//    let rooms: [Rooms]
//    
//    enum CodingKeys: String, CodingKey {
//        
//        case hotelName = "hotelNme"
//        case address = "adress"
//        case rooms = "roms"
//    }
//}
//
//struct HotelData: Decodable{
//    let hotel: Hotel
//}
