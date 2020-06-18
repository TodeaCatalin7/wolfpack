//
//  CustomError.swift
//  wolfpackTest
//
//  Created by Todea  Catalin on 15/02/2020.
//  Copyright © 2020 Todea  Catalin. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case invalidOrders
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidOrders:
            return NSLocalizedString("Something went wrong handling the orders.", comment: "The response is nil.")
        }
    }
}
