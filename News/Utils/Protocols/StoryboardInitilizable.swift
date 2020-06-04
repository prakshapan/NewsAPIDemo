//
//  StoryboardInitilizable.swift
//  Ringo
//
//  Created by Praks on 2/19/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInitializable where Self: UIViewController {

    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }

    static func initializeVC() -> Self {
        
        let storyboardName = Storyboard.init(rawValue: storyboardIdentifier)?.name
        let storyboard = UIStoryboard(name: storyboardName!, bundle: Bundle.main)
        // swiftlint:disable force_cast
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        // swiftlint:enable force_cast
    }
}

extension UIViewController: StoryboardInitializable { }
