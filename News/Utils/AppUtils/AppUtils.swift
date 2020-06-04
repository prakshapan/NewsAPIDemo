//
//  AppUtils.swift
//  News
//
//  Created by Praks on 6/3/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import Foundation
struct AppUtils {
    
}


extension AppUtils {
    // MARK: Serialize JSON
    @discardableResult static func serializeJSON(data: Data) -> AnyObject {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
            return json as AnyObject
        } catch let error as NSError {

            print("JSONSerialization error:\(error.localizedDescription)")
            return [:] as AnyObject
        }
    }

    static func decodeJSON<JsonCodable>(type: JsonCodable.Type, from data: Data) -> JsonCodable? where JsonCodable: Decodable {
        do {
            let decoder = JSONDecoder()
            let parsedData = try decoder.decode(type, from: data)
            return parsedData
        }
        //decodeJSON
        catch let err {
            print("Codable Error: ", err)
            return nil
        }

    }
}

extension AppUtils {
    static func convertDateFormater(with date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "MMM d, yyyy"
        return  dateFormatter.string(from: date!)
    }
}
