//
//  OrderController.swift
//  wolfpackTest
//
//  Created by Todea  Catalin on 06/02/2020.
//  Copyright © 2020 Todea  Catalin. All rights reserved.
//

import Foundation

class OrderController {
    
    var nrOfOrders = 0
    var orders: [Order] = []
    
    
    let service = OrderService()
    
    func getOrders(completion: @escaping (Error?) -> ()) {
        self.service.getRequest { (error, orders) in
            if error == nil {
                if let _ = orders {
                     self.nrOfOrders = orders!.count
                     self.orders = orders!
                     completion(nil)
                }
            } else {
                completion(error)
            }
        }
    }
}
