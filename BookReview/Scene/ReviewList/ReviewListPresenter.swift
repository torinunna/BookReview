//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/01.
//

import Foundation

protocol ReviewListProtocol {
    func setUpNavigationBar()
}

final class ReviewListPresenter {
    private let viewController: ReviewListProtocol
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpNavigationBar()
    }
    
}
