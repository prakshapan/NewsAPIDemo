//
//  TopNews+CollectionDelegate.swift
//  News
//
//  Created by Praks on 6/4/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit
extension TopNewsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = categories[indexPath.row].rawValue
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)
            ])
        return CGSize(width: itemSize.width + 20, height: 45)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCategory = indexPath.row
    }
}
