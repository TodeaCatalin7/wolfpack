//
//  OrderService.swift
//  wolfpackTest
//
//  Created by Todea  Catalin on 06/02/2020.
//  Copyright © 2020 Todea  Catalin. All rights reserved.
//

import Foundation
import Alamofire

class OrderService {
    private let html = "http://demo6683780.mockable.io/get_all"
    
    func getRequest(completion: @escaping (Error?, [Order]?) -> ()) {
        AF.request("https://demo6683780.mockable.io/get_all", method: .get, parameters: nil).responseJSON { (response) in
            do {
                if let _ = response.data {
                    let order: [Order] = try JSONDecoder().decode([Order].self, from: response.data!)
                    completion(nil, order)
                } else {
                    throw CustomError.invalidOrders
                }
            } catch {
                completion(error, nil)
            }
            //This verifications should be enought for us to be sure that the Order list is not nil if the error is nil
        }
    }
}
