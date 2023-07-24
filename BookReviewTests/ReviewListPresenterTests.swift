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

    override func setUp() {
        super.setUp()
        
        viewController = MockReviewListViewController()
        sut = ReviewListPresenter(viewController: viewController)
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
