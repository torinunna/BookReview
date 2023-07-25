//
//  ReviewListPresenterTests.swift
//  BookReviewTests
//
//  Created by YUJIN KWON on 2023/07/01.
//

import XCTest
@testable import BookReview

class ReviewListPresenterTests: XCTestCase {

    var sut: ReviewListPresenter!
    var viewController: MockReviewListViewController!
    var userDefaultsManager: MockUserDefaultsManager!

    override func setUp() {
        super.setUp()
        
        viewController = MockReviewListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        sut = ReviewListPresenter(viewController: viewController, userDefaultsManager: userDefaultsManager)
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isSetUpNavigationBarCalled)
        XCTAssertTrue(viewController.isSetUpViewsCalled)
    }
    
    func test_rightBarBtnPressed() {
        sut.rightBarBtnPressed()
        
        XCTAssertTrue(viewController.isPresentReviewWriteVCCalled)
    }
    
    func test_viewWillAppear() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isGetReviewsCalled)
        XCTAssertTrue(viewController.isReloadTableViewCalled)
    }
}

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    
    var isGetReviewsCalled = false
    var isSetReviewsCalled = false
    
    func getReviews() -> [BookReview] {
        isGetReviewsCalled = true
        return []
    }
    
    func setReviews(_ newValue: BookReview) {
        isSetReviewsCalled = true
    }
    
    
}

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
