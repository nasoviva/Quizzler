//
//  Question.swift
//  Quizzler
//
//  Created by Victoria on 08/06/2024.
//

import Foundation

struct Question {
    let text: String
    let firstOption: String
    let secondOption: String
    let thirdOption: String
    let correctAnswer: String

    init(q: String, a: [String], correctAnswer: String) {
        text = q
        firstOption = a[0]
        secondOption = a[1]
        thirdOption = a[2]
        self.correctAnswer = correctAnswer
    }
}
