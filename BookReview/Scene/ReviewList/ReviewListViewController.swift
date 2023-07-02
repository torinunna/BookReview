//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/01.
//
import SnapKit
import UIKit

final class ReviewListViewController: UIViewController {
    
    private lazy var presenter = ReviewListPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}

extension ReviewListViewController: ReviewListProtocol {
    func setUpNavigationBar() {
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setUpViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
