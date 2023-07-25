//
//  MockReviewWriteViewController.swift
//  BookReviewTests
//
//  Created by YUJIN KWON on 2023/07/25.
//

import Foundation

@testable import BookReview

final class MockReviewWriteViewController: ReviewWriteProtocol {
    
    var isSetUpNavigationBarCalled = false
    var isShowCloseAlertCalled = false
    var isSaveCalled = false
    var isSetUpViewsCalled = false
    var isPresentSearchBookVCCalled = false
    var isUpdateViewsCalled = false
    
    func setUpNavigationBar() {
        isSetUpNavigationBarCalled = true
    }
    
    func showCloseAlert() {
        isShowCloseAlertCalled = true
    }
    
    func save() {
        isSaveCalled = true
    }
    
    func setUpViews() {
        isSetUpViewsCalled = true
    }
    
    func presentSearchBookVC() {
        isPresentSearchBookVCCalled = true
    }
    
    func updateViews(title: String, imageURL: URL?) {
        isUpdateViewsCalled = true
    }
}
