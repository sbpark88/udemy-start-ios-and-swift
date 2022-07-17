//
// Created by 박새별 on 2022/07/15.
// Copyright (c) 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var height: Float?
    var weight: Float?
    var bmi: BMI?

    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height / 100, 2)

        /*let advice: String?
        switch bmiValue {
        case ..<18.5: advice = "Underweight"
        case 18.5...24.9: advice = "Normal weight"
        default: advice = "Overweight"
        }

        bmi = BMI(value: bmiValue, advice: advice!, color: <#T##UIColor##UIKit.UIColor#>)*/

        // swiftlint:disable: line_length
        switch bmiValue {
        case ..<18.5: bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.init(red: 56 / 255, green: 73 / 255, blue: 1, alpha: 0.95))
        case 18.5...24.9: bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.init(red: 11 / 255, green: 203 / 255, blue: 62 / 255, alpha: 1))
        default: bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
        }
        // swiftlint:enable: line_length

    }

    func getBMIValue() -> String {
        String(format: "%1.f", bmi?.value ?? 0.0)
    }

    func getAdvice() -> String {
        bmi?.advice ?? "I cannot calculate."
    }

    func getColor() -> UIColor {
        bmi?.color ?? .white
    }
}
