//
//  PersonInfo.swift
//  FacebookFriends
//
//  Created by Rumeysa Yücel on 4.12.2021.
//

import Foundation

struct PersonInfo: Codable {
    let results: [Results]
}
struct Results: Codable {
    let name: Name
    let picture: Picture
    let email: String
    let phone: String
    let dob: Dob
    let location: Location
}
struct Name: Codable {
    let first: String
    let last: String
}
struct Picture: Codable {
    let medium: URL
}
struct Dob: Codable {
    let age: Int
}
struct Location: Codable {
    let country: String
    let city: String
    let coordinates: Coordinates
}
struct Coordinates: Codable {
    let longitude: Double
    let latitude: Double
}
