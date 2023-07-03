//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/02.
//

import Foundation

protocol ReviewWriteProtocol {
    func setUpNavigationBar()
    func showCloseAlert()
    func save()
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpNavigationBar()
    }
    
    func leftBarBtnPressed() {
        viewController.showCloseAlert()
    }
    
    func rightBarBtnPressed() {
//        Todo: UserDefaults에 리뷰 저장
        viewController.save()
    }
}
