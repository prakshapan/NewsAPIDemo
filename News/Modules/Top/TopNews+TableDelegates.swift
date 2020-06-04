//
//  TopNews+TableDelegates.swift
//  News
//
//  Created by Praks on 6/4/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit

extension TopNewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == tableView.numberOfSections - 1 &&
            indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            guard totalArticles > self.articles.count else { return }
            self.pageIndex += 1
            self.getTopHeadlines()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = NewsDetailViewController.initializeVC()
        destinationVC.detail = articles[indexPath.row]
        DispatchQueue.main.async {
            self.present(destinationVC, animated: true, completion: nil)
        }
    }

}

