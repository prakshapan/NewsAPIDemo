//
//  Created by Praks on 2/19/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import Foundation

typealias NetworkResponse = (response: Data?, statusCode: Int?)

class NetworkOperation: NSObject {
    var router: Router
    lazy var webService = WebOperation()
    init(router: Router) {
        self.router = router
    }
}

extension NetworkOperation {

    func request(completionHandler: @escaping (Result<NetworkResponse, Error>) -> Void) {
        print("""
            /** Request **/
            URL: \(String.init(describing: router.url))
            Header: \(String.init(describing: router.headers))
            Method: \(String.init(describing: router.method))
            Parameters: \(String.init(describing: router.parameters))
            -------------------------------------------------------
            
            """
        )

        webService.router = router
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 300
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: nil)

        webService.send(session: session) { (result) in
            switch result {
            case .success(let networkResponse):
                if let code = networkResponse.statusCode {
                    switch code {
                    case 200...299:
                        completionHandler(.success(NetworkResponse(networkResponse.response, code)))
                    default:
                        var genericError = NetworkError.responseStatusError(status: code,
                            message: ErrorMessage.unknownError)
                        if let data = networkResponse.response {
                            if let errorMsg = AppUtils.decodeJSON(type: ErrorCodable.self, from: data) {
                                genericError = NetworkError.responseError(message: errorMsg.message ?? "")
                            }
                        }
                        completionHandler(.failure(genericError))
                    }
                } else {
                    let genericError = NetworkError.responseStatusError(status: 500,
                        message: ErrorMessage.unknownError)
                    completionHandler(.failure(genericError))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }

    }
    
    private func performUpdateHandler() {
        // Perform Update Here
    }
}

extension NetworkOperation: URLSessionDataDelegate, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}
