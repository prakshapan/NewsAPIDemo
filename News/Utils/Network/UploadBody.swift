//
//  Created by Praks on 2/19/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import Foundation
struct UploadBody {
    static func createBodyWithImage(parameters: [String: String]?,
                                    uploadKey: String,
                                    uploadData: Data,
                                    imageName: String,
                                    boundary: String) -> Data {
        var body = Data()
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }

        let filename = imageName
        let mimetype = "image/jpg"

        body.appendString(string: "--\(boundary)\r\n")
        body.appendString(string: "Content-Disposition: form-data; name=\"\(uploadKey)\"; filename=\"\(filename)\"\r\n")
        body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
        body.append(uploadData)
        body.appendString(string: "\r\n")

        body.appendString(string: "--\(boundary)--\r\n")
        return body

    }
}

extension Data {
    mutating func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}
