//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/01.
//

import UIKit

final class ReviewListViewController: UIViewController {
    
    private lazy var presenter = ReviewListPresenter(viewController: self)

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
}
