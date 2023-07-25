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
    
}
