//
//  Book.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/04.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
    
    init(title: String, imageURL: String?) {
        self.title = title
        self.image = imageURL
    }
}

