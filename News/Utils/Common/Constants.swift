//
//  Constants.swift
//  News
//
//  Created by Praks on 6/3/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import Foundation
struct APIKey {
    static let newsKey = "617e9fe247ce4a61812d6b450d390288"
}

struct AppUrl {
    static let baseUrl = "http://newsapi.org/v2/"
}

struct Header {
    static let token = APIKey.newsKey
    static let contentType = "application/json"
}
