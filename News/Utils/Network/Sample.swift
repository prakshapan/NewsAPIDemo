//
//  Sample.swift
//  Riingo
//
//  Created by Praks on 3/6/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import Foundation

// MARK: SAMPLE NETWORK CALL
class Sample {
    func fetchExchangeRates() {
        let exchangeRoute = CommonRouter.exchangeRate
        NetworkOperation(router: exchangeRoute).request { (result) in
            switch result {
            case .success(let networkResponse):
                print(networkResponse.response!)
                print(networkResponse.statusCode!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: SAMPLE ROUTER FOR EACH MODULE
enum CommonRouter: Router {
    case exchangeRate
    case other

    var url: URL {
        switch self {
        case .exchangeRate:
            return URL(string: "")!
        default:
            return URL(string: "")!
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .exchangeRate:
            return ["Content-Type": "application/json"]
        default:
            return [:]
        }
    }
}
