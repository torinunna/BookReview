//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/02.
//

import SnapKit
import UIKit

final class ReviewWriteViewController: UIViewController {
    
    private lazy var presenter = ReviewWritePresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

extension ReviewWriteViewController: ReviewWriteProtocol {
    func setUpNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(leftBarBtnPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(rightBarBtnPressed))
    }
    
    func showCloseAlert() {
        let alertController = UIAlertController(title: "작성 중인 내용이 있습니다. 정말 닫으시겠습니까?", message: nil, preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "닫기", style: .destructive) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        [closeAction, cancelAction].forEach { alertController.addAction($0) }
        
        present(alertController, animated: true)
    }
    
    func save() {
        dismiss(animated: true)
    }
}

private extension ReviewWriteViewController {
    @objc func leftBarBtnPressed() {
        presenter.leftBarBtnPressed()
    }
    
    @objc func rightBarBtnPressed() {
        presenter.rightBarBtnPressed()
    }
}
