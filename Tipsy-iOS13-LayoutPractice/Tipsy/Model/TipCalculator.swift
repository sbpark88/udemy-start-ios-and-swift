//
// Created by 박새별 on 2022/08/02.
// Copyright (c) 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipCalculator {
    var billTotal: Double?
    var tipPercent: Double?
    var people: Double?

    let numberRegex: String = "^(0?\\.\\d+|[1-9]\\d*\\.?\\d*)$"

    mutating func setBillTotal(_ billTotal: String) {
        // 'billTotal' can pass the guard let condition when ""(empty string)
        // Therefore, we must check it.
        // In this code, I used regex to check is it number format.
        if billTotal.range(of: numberRegex, options: .regularExpression) != nil {
            self.billTotal = Double(billTotal)
        }
    }

    mutating func setTipPercent(_ tipPercent: Int) {
        self.tipPercent = Double(tipPercent)
    }

    mutating func setPeople(split people: Double) {
        self.people = people
    }

    func calculateTip() -> String {
        let eachTip: Double = billTotal! * (1 + (tipPercent! / 100)) / people!
        return String(format: "%.2f", eachTip)
    }

}
