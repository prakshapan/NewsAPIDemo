//
//  TopNewsViewController.swift
//  News
//
//  Created by Praks on 6/3/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import UIKit

final class TopNewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.newsListStyle()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.categoriesStyle()
        }
    }

    enum Section { case main }
    var articles: [Article] = []
    var categories = Categories.allCases
    var selectedCategory = 0 {
        didSet {
            self.resetData()
        }
    }

    var pageIndex = 1
    var totalArticles = 0

    private lazy var dataSource = UITableViewDiffableDataSource<Section, Article>(tableView: tableView) { (tableView, indexPath, item) -> UITableViewCell? in
        let cell = tableView.dequeReusableCell(withClass: NewsListCell.self, for: indexPath)
        cell.setupCell(with: item)
        return cell
    }

    private lazy var collectionDataSource = UICollectionViewDiffableDataSource<Section, Categories>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
        let cell = collectionView.dequeReusableCell(withClass: CategoriesCell.self, for: indexPath)
        cell.titleLabel.text = item.rawValue
        cell.titleLabel.backgroundColor = indexPath.row == self.selectedCategory ? #colorLiteral(red: 0, green: 0.2143455744, blue: 1, alpha: 0.1006547095): .white
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.loadTableView()

        self.collectionView.delegate = self
        self.loadCollectionView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.resetData()
    }

    func loadTableView() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Article>()
        snapshot.appendSections([.main])
        snapshot.appendItems(articles)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    private func loadCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Categories>()
        snapshot.appendSections([.main])
        snapshot.appendItems(categories)
        collectionDataSource.apply(snapshot, animatingDifferences: true)
    }

    private func resetData() {
        articles = []
        pageIndex = 0
        totalArticles = 0
        collectionView.reloadData()
        loadTableView()
        getTopHeadlines()
    }
}


