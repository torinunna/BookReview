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
