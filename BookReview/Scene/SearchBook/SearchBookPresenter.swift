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
    func reloadView()
}

final class SearchBookPresenter: NSObject {
 
    private let viewController: SearchBookProtocol
    private let bookSearchManager = BookSearchManager()
    
    private var books: [Book] = []
    
    init(viewController: SearchBookProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpViews()
    }
}

extension SearchBookPresenter: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        bookSearchManager.request(from: searchText) { [weak self] newBooks in
            self?.books = newBooks
            self?.viewController.reloadView()
        }
    }
}

extension SearchBookPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = books[indexPath.row].title
        return cell
    }
}

extension SearchBookPresenter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController.dismiss()
    }
}
