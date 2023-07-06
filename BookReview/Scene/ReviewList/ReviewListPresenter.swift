//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/01.
//

import Kingfisher
import UIKit

protocol ReviewListProtocol {
    func setUpNavigationBar()
    func setUpViews()
    func presentReviewWriteVC()
    func reloadTableView()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol
    private let userDefaultsManager = UserDefaultsManager()
    
    private var review: [BookReview] = []
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpNavigationBar()
        viewController.setUpViews()
    }
    
    func viewWillAppear() {
        review = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }
    
    func rightBarBtnPressed() {
        viewController.presentReviewWriteVC()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return review.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let review = review[indexPath.row]
        cell.textLabel?.text = review.title
        cell.imageView?.kf.setImage(with: review.imageURL, placeholder: .none) { _ in
            cell.setNeedsLayout()
        }
        cell.selectionStyle = .none
        return cell
    }
}
