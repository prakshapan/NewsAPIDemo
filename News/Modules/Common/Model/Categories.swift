//
//  Categories.swift
//  News
//
//  Created by Praks on 6/4/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import Foundation
enum Categories: String, CaseIterable {
    case All
    case Business
    case Entertainment
    case General
    case Health
    case Science
    case Sports
    case Technology

    var postValue: String {
        switch self {
        case .All: return ""
        case .Business: return "business"
        case .Entertainment: return "entertainment"
        case .General: return "general"
        case .Health: return "health"
        case .Science: return "science"
        case .Sports: return "sports"
        case .Technology: return "technology"
        }
    }
}
