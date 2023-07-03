//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/03.
//

import UIKit

final class SearchBookViewController: UIViewController {
    
    private lazy var presenter = SearchBookPresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchBookViewController: SearchBookProtocol {
    
}
