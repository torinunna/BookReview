//
//  MockReviewListViewController.swift
//  BookReviewTests
//
//  Created by YUJIN KWON on 2023/07/25.
//

import Foundation

@testable import BookReview

final class MockReviewListViewController: ReviewListProtocol {
    
    var isSetUpNavigationBarCalled = false
    func setUpNavigationBar() {
        isSetUpNavigationBarCalled = true
    }
    
    var isSetUpViewsCalled = false
    func setUpViews() {
        isSetUpViewsCalled = true
    }
    
    var isPresentReviewWriteVCCalled = false
    func presentReviewWriteVC() {
        isPresentReviewWriteVCCalled = true
    }
    
    var isReloadTableViewCalled = false
    func reloadTableView() {
        isReloadTableViewCalled = true
    }
    
}
