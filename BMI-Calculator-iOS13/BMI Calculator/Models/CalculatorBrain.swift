//
// Created by 박새별 on 2022/07/15.
// Copyright (c) 2022 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var height: Float?
    var weight: Float?
    var bmi: Float?

    mutating func calculateBMI(height: Float, weight: Float) {
        bmi = weight / pow(height / 100, 2)
    }

    func getBMIValue() -> String {
        guard let bmi = bmi else {
            fatalError("guard failure handling has not been implemented")
        }
        return String(format: "%.1f", bmi)
    }
}
