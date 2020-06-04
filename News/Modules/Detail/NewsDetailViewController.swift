//
//  NewsDetailViewController.swift
//  News
//
//  Created by Praks on 6/4/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit
import Nuke
class NewsDetailViewController: UIViewController {

    var detail: Article?

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var publisherNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var articleDetailLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!

    @IBAction func detailAction(_ sender: Any) {
        if let detailUrl = detail?.url,
            let url = URL(string: detailUrl) {
            UIApplication.shared.open(url)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }

    private func setupView() {

        publisherNameLabel.text = "Source: \(detail?.source?.name ?? "")"
        titleLabel.text = detail?.title ?? ""
        authorNameLabel.text = detail?.author ?? "Author: Unknown"
        articleDetailLabel.text = detail?.articleDescription ?? ""
        
        if let date = detail?.publishedAt {
           publishedDateLabel.text = AppUtils.convertDateFormater(with: date)
        }

        articleImageView.layer.cornerRadius = 12
        let placeHolderImage = UIImage(named: "placeHolderImage")
        if let imagePath = detail?.urlToImage,
            let imageUrl = URL(string: imagePath) {
            Nuke.loadImage(with: imageUrl,
                options: ImageLoadingOptions(placeholder: placeHolderImage,
                    transition: .fadeIn(duration: 0.5),
                    failureImage: placeHolderImage,
                    failureImageTransition: .fadeIn(duration: 0.3)),
                into: self.articleImageView)
        }

        detailButton.backgroundColor = .clear
        detailButton.layer.cornerRadius = 10
        detailButton.layer.borderWidth = 0.7
        detailButton.layer.borderColor = #colorLiteral(red: 0.1243535355, green: 0.5372629166, blue: 1, alpha: 0.7031525088).cgColor
    }

}
