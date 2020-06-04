//
//  NetworkError.swift
//  Riingo
//
//  Created by Praks on 3/10/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import Foundation
enum NetworkError: LocalizedError {
    case responseStatusError(status: Int, message: String)
    case responseError(message: String)
}

extension NetworkError {
    public var errorDescription: String? {
        switch self {
        case let .responseStatusError(status, message):
            return "Error with status \(status) and message \"\(message)\" has occured."
        case let .responseError(message: message):
            return message
        }
    }
}
