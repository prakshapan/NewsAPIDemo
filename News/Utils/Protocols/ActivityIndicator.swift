//
//  ActivityIndicator.swift
//  Ringo
//
//  Created by Praks on 2/19/20.
//  Copyright © 2020 PandoDev. All rights reserved.
//

import UIKit
protocol ActivityIndicatorPresenter {
}

extension UIViewController: ActivityIndicatorPresenter { }
extension ActivityIndicatorPresenter where Self: UIViewController {

    func showActivityIndicator(_ message: String = "") {

        let window = UIWindow()
        let activityIndicator = UIActivityIndicatorView()
        let indicatorWidth: CGFloat = 65
        let lbl = UILabel()

        activityIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.07)
        activityIndicator.layer.cornerRadius = 10
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: indicatorWidth, height: indicatorWidth)
        activityIndicator.tag = 977 // 100 for example

        lbl.text = message
        lbl.frame = CGRect(x: 0, y: 35, width: lbl.intrinsicContentSize.width, height: indicatorWidth)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)

        if lbl.frame.width > indicatorWidth {
            activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: lbl.frame.width, height: indicatorWidth)
        } else {
            lbl.frame = CGRect(x: 0, y: 35, width: indicatorWidth, height: indicatorWidth)
        }

        activityIndicator.center = CGPoint(x: (window.bounds.width) / 2, y: (window.bounds.height) / 2)
        // before adding it, you need to check if it is already has been added:
        for subview in self.view.subviews where subview.tag == 997 {
            return
        }
        self.view.isUserInteractionEnabled = false
        activityIndicator.addSubview(lbl)
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

    }

    func dimissActivityIndicator() {

        let activityIndicator = self.view.viewWithTag(977) as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        self.view.isUserInteractionEnabled = true

        activityIndicator?.removeFromSuperview()

    }
}
