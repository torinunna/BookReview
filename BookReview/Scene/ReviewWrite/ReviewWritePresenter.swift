//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/02.
//

import Foundation

protocol ReviewWriteProtocol {
    func setUpNavigationBar()
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpNavigationBar()
    }
}
