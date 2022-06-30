//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by 박새별 on 2022/06/30.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(question: "A slug's blood is green.", answer: "True"),
        Question(question: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        // swiftlint:disable: line_length
        Question(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        // swiftlint:disable: line_length
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        // swiftlint:disable: line_length
        Question(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(question: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(question: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(question: "Google was originally called 'Backrub'.", answer: "True"),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    let quizCount: Int
    var questionNumber = 0

    init() {
        quizCount = quiz.count
    }

    // answer : argument labels, userAnswer : parameters
    func checkAnswer(answer userAnswer: String) -> Bool {
        userAnswer == quiz[questionNumber].answer ? true : false
    }

    func getCurrentQuestion() -> String {
        quiz[questionNumber].text
    }

    mutating func increaseQuestionNumber() {
        // swiftlint:disable shorthand_operator
        questionNumber = questionNumber + 1 < quizCount
                ? questionNumber + 1
                : 0
    }

}
