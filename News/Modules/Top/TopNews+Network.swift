//
//  TopNews+Network.swift
//  News
//
//  Created by Praks on 6/4/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import Foundation
extension TopNewsViewController {
    
    func getTopHeadlines() {
        let selectedCategory = self.categories[self.selectedCategory].postValue
        let router = NewsRouter.topHeadlines(countryCode: "us",
            category: selectedCategory,
            page: self.pageIndex)
        
        self.showActivityIndicator()
        NetworkOperation(router: router).request { [weak self] (result) in
            guard let self = self else { return }
            self.dimissActivityIndicator()
            switch result {
            case .success(let networkResponse):
                if let data = networkResponse.response,
                    let news = AppUtils.decodeJSON(type: News.self, from: data),
                    let articles = news.articles {
                    self.articles.append(contentsOf: articles)
                    self.totalArticles = news.totalResults ?? 0
                    self.loadTableView()
                }
            case .failure(let error):
                self.showAlert(message: error.localizedDescription)
            }
        }
    }
}
