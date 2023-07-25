//
//  MockUserDefaultsManager.swift
//  BookReviewTests
//
//  Created by YUJIN KWON on 2023/07/25.
//

import Foundation

@testable import BookReview

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
