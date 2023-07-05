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
    
    private let userDefaultsManager = UserDefaultsManager()
    private var book: Book?
    
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
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
        let bookReview = BookReview(title: book.title, contents: contentsText, imageURL: book.imageURl)
        userDefaultsManager.setReview(bookReview)
        viewController.save()
    }
    
    func bookTitleBtnPressed() {
        viewController.presentSearchBookVC()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectiBook(_ book: Book) {
        self.book = book
        viewController.updateViews(title: book.title, imageURL: book.imageURl)
    }
}
