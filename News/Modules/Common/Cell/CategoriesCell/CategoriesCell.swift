//
//  CategoriesCell.swift
//  News
//
//  Created by Praks on 6/4/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit

class CategoriesCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 4
    }

}
