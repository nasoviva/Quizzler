//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Victoria on 08/06/2024.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111?", a: ["Hear111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111t", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]

    var questionNumber = 0
    var score = 0

    func getScore() -> Int {
            return score
        }

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score = score + 1
            return true
        } else {
            return false
        }
    }

    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }

    func getFirstOptionsText() -> String {
        return quiz[questionNumber].firstOption
    }

    func getSecondOptionsText() -> String {
        return quiz[questionNumber].secondOption
    }

    func getThirdOptionsText() -> String {
        return quiz[questionNumber].thirdOption
    }

    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }

    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber = questionNumber + 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
