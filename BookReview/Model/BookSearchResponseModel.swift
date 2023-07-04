//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by YUJIN KWON on 2023/07/04.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items: [Book] = []
}
