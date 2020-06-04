//
//  NewsRouter.swift
//  News
//
//  Created by Praks on 6/3/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import Foundation
enum NewsRouter: Router {

    case topHeadlines(countryCode: String, category: String, page: Int)

    var url: URL {
        switch self {
        case .topHeadlines(let countryCode, let category, let page):
            let category = category == "" ? "" : "&category=" + category
            return URL(string: AppUrl.baseUrl + "top-headlines?country=\(countryCode)\(category)&page=\(page)")!
        }
    }

    // Config Methods Type
    var method: String {
        NetworkMethod.GET.rawValue
    }

    // Config Headers
    var headers: [String: String] {
        ["X-API-KEY": Header.token]
    }
    // Config Parameters
    var parameters: [String: Any] { [:] }
}
