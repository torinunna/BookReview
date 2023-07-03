//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/02.
//

import SnapKit
import UIKit

final class ReviewWriteViewController: UIViewController {
    
    private lazy var presenter = ReviewWritePresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

extension ReviewWriteViewController: ReviewWriteProtocol {
    func setUpNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
    }
}
