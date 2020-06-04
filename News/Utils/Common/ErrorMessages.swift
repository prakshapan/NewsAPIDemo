//
//  ErrorMessages.swift
//  News
//
//  Created by Praks on 6/3/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import Foundation
struct ErrorMessage {
    static let unknownError = "unknown error"
    static let mustContain = "Please enter a value."
    static let mustContainAlphaNum = "Please enter alphanumeric value."
    static let email = "email"
    static let password = "password"
    static let cvv = "cvv"
    static let date = "Please select a date."
    static let card = "card"
    static let firstName = "first Name"
    static let lastName = "last Name"
    static let routingNo = "routing number"
    static let accountNo = "account number"
    static let streetAddress = "street address"
    static let aptSuite = "apt/suite"
    static let city = "city"
    static let state = "state"
    static let zip = "zip"
    
    static func enterValid(_ message: String) -> String {
        return "Please enter valid " + message + "."
    }
    
    static func enter(_ message: String) -> String {
        return "Please enter " + message + "."
    }
}
