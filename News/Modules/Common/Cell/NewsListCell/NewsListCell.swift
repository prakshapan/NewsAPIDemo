//
//  NewsListCell.swift
//  News
//
//  Created by Praks on 6/3/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit
import Nuke

class NewsListCell: UITableViewCell, NibReusable {
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.articleImageView.layer.cornerRadius = 10

        backView.layer.masksToBounds = false
        backView.layer.shadowOffset = CGSize.zero
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 0.23
        backView.layer.shadowRadius = 4
        backView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(with element: Article) {
        let placeHolderImage = UIImage(named: "placeHolderImage")
        titleLabel.text = element.title
        authorLabel.text = element.author ?? "Author: Unknown"
        if let date = element.publishedAt {
           dateLabel.text = AppUtils.convertDateFormater(with: date)
        }
        

        if let imagePath = element.urlToImage,
            let imageUrl = URL(string: imagePath) {
            Nuke.loadImage(with: imageUrl,
                options: ImageLoadingOptions(placeholder: placeHolderImage,
                    transition: .fadeIn(duration: 0.5),
                    failureImage: placeHolderImage,
                    failureImageTransition: .fadeIn(duration: 0.3)),
                into: self.articleImageView)
        }
    }

}
