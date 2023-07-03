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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

}

extension ReviewListViewController: ReviewListProtocol {
    func setUpNavigationBar() {
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightBarBtnPressed))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setUpViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func presentReviewWriteVC() {
        let vc = UINavigationController(rootViewController: ReviewWriteViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func reloadTableView() {
        tableView.reloadData()
        print("최신 도서 리뷰 보여주기")
    }
}

private extension ReviewListViewController {
    @objc func rightBarBtnPressed() {
        presenter.rightBarBtnPressed()
    }
}
