//
//  Book.swift
//  Bookworm
//
//  Created by ☕️ Gabo.montero on 3/19/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    let date = Date.now
    
    var formattedDate: String {
        date.formatted(date: .complete, time: .omitted)
    }
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}
