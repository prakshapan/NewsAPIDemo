//
//  Storyboard.swift
//  News
//
//  Created by Praks on 6/3/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit
enum Storyboard: String {

    // Gives back ViewController
    case allNews = "AllNewsViewController"
    case topNews = "TopNewsViewController"
    case detailNews = "NewsDetailViewController"

    var name: String {
        switch self {
        case .allNews, .topNews, .detailNews:
            return "Home"
        }

    }

    var value: UIStoryboard {
        return UIStoryboard(name: self.name, bundle: Bundle.main)
    }
}
