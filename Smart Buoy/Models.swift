//
//  Models.swift
//  Smart Buoy
//
//  Created by Nijat Mukhtarov on 01.08.22.
//

import Foundation

struct City: Codable{
    let name: String
    let beaches: [Beach]
}

struct Beach: Codable{
    let name: String
    let coorX: String
    let coorY: String
    let colorOfFlag: String
    let tempratureOfWater: String
    let cleanlinessOfWater: String
    let image: String
}

