//
//  AppTableViewExtension.swift
//  News
//
//  Created by Praks on 6/3/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit
extension UITableView {
    func generalStyle() {
        self.bounces = true
        self.tableFooterView = UIView()
        self.separatorStyle = .none
        self.estimatedRowHeight = 80
        self.showsVerticalScrollIndicator = false
        self.rowHeight = UITableView.automaticDimension
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = .clear
    }

    func separatorStyle() {
        self.separatorStyle = .singleLine
        self.separatorColor = #colorLiteral(red: 0.8495151401, green: 0.8496581912, blue: 0.849496305, alpha: 1)
        self.separatorInset = .zero
    }

    func newsListStyle() {
        generalStyle()
        self.register(cellType: NewsListCell.self)
    }

}
