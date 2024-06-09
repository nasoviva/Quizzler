//
//  Question.swift
//  Quizzler
//
//  Created by Victoria on 08/06/2024.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    //let options: [String]
    //let correctAnswer: String


    init(q: String, a: String) {
        text = q
        answer = a
    }

//    init(q: String, o: [String], a: String) {
//        text = q
//        options = o
//        correctAnswer = a
//    }
}
