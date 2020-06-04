//
//  Created by Praks on 2/19/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import Foundation

protocol ConstructableRequest: Router {
    func buildRequest() -> URLRequest?
}

extension ConstructableRequest {
    func buildRequest() -> URLRequest? {
        var request = URLRequest(url: url)
        if method != "GET" {
            // For Upload
            if let uploadParam = uploadParameters {
                request.httpBody = uploadParam
            } else {
                // For Normal
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            }
        }

        // MARK: Configure for other Methods (DELETE, PUT etc....)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method
        return request
    }
}
