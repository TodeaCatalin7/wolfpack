//
//  OrderViewModel.swift
//  wolfpackTest
//
//  Created by Todea  Catalin on 06/02/2020.
//  Copyright © 2020 Todea  Catalin. All rights reserved.
//

import Foundation

class OrderViewModel {
    
    private let controller = OrderController()
    
    let title: String = "Your Orders"
    let errorAlertTitle = "Error fetching the data!"
    let reloadAlertButton = "Reload"
    
    func getItems(completion: @ escaping (Error?) -> ()) {
        self.controller.getOrders { (err) in
            if err == nil {
                completion(nil)
            } else {
                completion(err)
            }
        }
    }
    
    func getNrOfItems() -> Int {
        return controller.nrOfOrders
    }
    
    func getOrder(fromIndex ind: Int) -> Order {
        return controller.orders[ind]
    }
}

