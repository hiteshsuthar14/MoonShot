//
//  Astronaut.swift
//  MoonShot
//
//  Created by Hitesh Suthar on 17/06/22.
//

import Foundation
//for converting JSON to Swift Struct. Codable converts JSON data into Swift structs
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
