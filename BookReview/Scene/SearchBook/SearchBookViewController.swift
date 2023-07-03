//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/03.
//

import SnapKit
import UIKit

final class SearchBookViewController: UIViewController {
    
    private lazy var presenter = SearchBookPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        tableView.delegate = presenter
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension SearchBookViewController: SearchBookProtocol {
    func setUpViews() {
        view.backgroundColor = .systemBackground
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = presenter
        navigationItem.searchController = searchController
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
