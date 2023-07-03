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

extension SearchBookPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

extension SearchBookPresenter: UITableViewDelegate{
    
}
