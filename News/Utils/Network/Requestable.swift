//
//  Created by Praks on 2/19/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import Foundation

protocol Requestable: ConstructableRequest { }

extension Requestable {

    func send(session: URLSession,
              completionHandler: @escaping (Result<NetworkResponse, Error>) -> Void) {

        guard let request = buildRequest() else { fatalError("Cannot build Request") }

        let task = session.dataTask(with: request as URLRequest,
            completionHandler: { (taskData, taskResponse, taskError) -> Void in
                print("/** Response **/")
                let statusCode = (taskResponse as? HTTPURLResponse)?.statusCode
                print("Response StatusCode: \(String(describing: statusCode))")

                if let taskError = taskError {
                    DispatchQueue.main.async {
                        completionHandler(.failure(taskError))
                    }
                } else if let taskData = taskData {
                    do {
                        let json = try JSONSerialization.jsonObject(with: taskData, options: [])
                        print("Response Data: \(String(describing: json))")
                        print("-------------------------------------------------------\n")
                        DispatchQueue.main.async {
                            completionHandler(.success(NetworkResponse(taskData, statusCode)))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completionHandler(.success(NetworkResponse(nil, statusCode)))
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completionHandler(.success(NetworkResponse(nil, statusCode)))
                    }
                }
            })
        task.resume()
    }
}
