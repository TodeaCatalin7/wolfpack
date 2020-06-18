//
//  Order.swift
//  wolfpackTest
//
//  Created by Todea  Catalin on 06/02/2020.
//  Copyright © 2020 Todea  Catalin. All rights reserved.
//

import Foundation

class Order: Decodable {
    var id: Int
    var description: String
    var price: Int
    var deliverTo: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "description"
        case price = "price"
        case deliverTo = "deliver_to"
    }
}
