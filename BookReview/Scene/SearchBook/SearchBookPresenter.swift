//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/03.
//

import UIKit

protocol SearchBookProtocol {
    func setUpViews()
    func dismiss()
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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
}

extension SearchBookPresenter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController.dismiss()
    }
}
