//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 박새별 on 2022/06/29.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: [String]
    let correctAnswer: String

    init(q text: String, a answer: [String], correctAnswer: String) {
        question = text
        self.answer = answer
        self.correctAnswer = correctAnswer
    }

}
