//
//  Mission.swift
//  MoonShot
//
//  Created by Hitesh Suthar on 17/06/22.
//

import Foundation

struct Mission: Codable, Identifiable { //Codable Protocol for achiving and unarchiving data
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
