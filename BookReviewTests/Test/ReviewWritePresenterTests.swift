//
//  ReviewWritePresenterTests.swift
//  BookReviewTests
//
//  Created by YUJIN KWON on 2023/07/25.
//

import XCTest
@testable import BookReview

class ReviewWritePresenterTests: XCTestCase {
    var sut: ReviewWritePresenter!
    var viewController: MockReviewWriteViewController!
    var userDefaultsMangaer: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        viewController = MockReviewWriteViewController()
        userDefaultsMangaer = MockUserDefaultsManager()
        
        sut = ReviewWritePresenter(viewController: viewController, userDefaultsManager: userDefaultsMangaer)
    }

    override func tearDown(){
        sut = nil
        viewController = nil
        userDefaultsMangaer = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isSetUpNavigationBarCalled)
        XCTAssertTrue(viewController.isSetUpViewsCalled)
    }
    
    func test_leftBarBtnPressed() {
        sut.leftBarBtnPressed()
        
        XCTAssertTrue(viewController.isShowCloseAlertCalled)
    }
    
    func test_rightBarBtnPressed() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.rightBarBtnPressed(contentsText: "유익한 책입니다.")
        
        XCTAssertTrue(userDefaultsMangaer.isSetReviewsCalled)
        XCTAssertTrue(viewController.isSaveCalled)
    }
    
    func test_bookTitleBtnPressed() {
        sut.bookTitleBtnPressed()
        
        XCTAssertTrue(viewController.isPresentSearchBookVCCalled)
    }
}
