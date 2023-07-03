//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/03.
//

import UIKit

protocol SearchBookProtocol {
    func setUpViews()
}

final class SearchBookPresenter: NSObject {
 
    private let viewController: SearchBookProtocol
    
    init(viewController: SearchBookProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpViews()
    }
}

extension SearchBookPresenter: UISearchBarDelegate {
}
