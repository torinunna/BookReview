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
    func setUpViews()
    func presentSearchBookVC()
    func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    
    private let userDefaultsManager: UserDefaultsManagerProtocol
    private var book: Book?
    
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
    
    init(viewController: ReviewWriteProtocol, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController.setUpNavigationBar()
        viewController.setUpViews()
    }
    
    func leftBarBtnPressed() {
        viewController.showCloseAlert()
    }
    
    func rightBarBtnPressed(contentsText: String?) {
        guard
            let book = book,
            let contentsText = contentsText,
            contentsText != contentsTextViewPlaceHolderText
        else { return }
        let bookReview = BookReview(title: book.title, contents: contentsText, imageURL: book.imageURL)
        userDefaultsManager.setReviews(bookReview)
        viewController.save()
    }
    
    func bookTitleBtnPressed() {
        viewController.presentSearchBookVC()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectiBook(_ book: Book) {
        self.book = book
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
