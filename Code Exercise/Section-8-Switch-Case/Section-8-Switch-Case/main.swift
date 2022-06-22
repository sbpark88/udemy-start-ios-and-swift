//
//  main.swift
//  Section-8-Switch-Case
//
//  Created by 박새별 on 2022/06/22.
//

import Foundation

//print("입력하세요.")
//var aNumber =  Int(readLine()!)!

func dayOfTheWeek(day: Int) {
    switch day {
        case 1:
            print("Monday")
        case 2:
            print("Tuesday")
        case 3:
            print("Wednesday")
        case 4:
            print("Thursday")
        case 5:
            print("Friday")
        case 6:
            print("Saturday")
        case 7:
            print("Sunday")
        default:
            print("Error")
    }
}

dayOfTheWeek(day: 0)
dayOfTheWeek(day: 6)
dayOfTheWeek(day: 7)

