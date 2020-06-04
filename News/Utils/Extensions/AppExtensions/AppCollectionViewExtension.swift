//
//  AppCollectionViewExtension.swift
//  News
//
//  Created by Praks on 6/4/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit
extension UICollectionView {

    func categoriesStyle() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 45)
        layout.minimumInteritemSpacing = 2
        self.collectionViewLayout = layout
        self.showsHorizontalScrollIndicator = false
        self.register(cellType: CategoriesCell.self)
    }
}
