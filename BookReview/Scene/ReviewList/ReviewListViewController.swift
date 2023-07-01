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
        // Do any additional setup after loading the view.
    }

}

extension ReviewListViewController: ReviewListProtocol {
    
}
