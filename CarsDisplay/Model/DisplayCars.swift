//
//  Model.swift
//  DisplayCars
//
//  Created by Balaji Peddaiahgari on 7/28/19.
//  Copyright © 2019 Balaji Peddaiahgari. All rights reserved.
//

import Foundation

struct DisplayCars: Codable {
    
    let cars: [Car]
    enum DisplayCarKeys: String, CodingKey {
        case cars = "listings"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DisplayCarKeys.self)
        cars = try container.decode([Car].self, forKey: .cars)
    }
}
