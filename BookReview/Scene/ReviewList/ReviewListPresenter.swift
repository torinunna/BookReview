//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/01.
//

import UIKit

protocol ReviewListProtocol {
    func setUpNavigationBar()
    func setUpViews()
    func presentReviewWriteVC()
    func reloadTableView()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpNavigationBar()
        viewController.setUpViews()
    }
    
    func viewWillAppear() {
//        Todo: UserDefaults 내용 업데이트
        viewController.reloadTableView()
    }
    
    func rightBarBtnPressed() {
        viewController.presentReviewWriteVC()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
    
   
    
    
}
