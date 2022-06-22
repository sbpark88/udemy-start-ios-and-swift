//
//  main.swift
//  Section-8-If-Else-Find-Leap-Year
//
//  Created by 박새별 on 2022/06/22.
//

import Foundation

enum InvalidInputError: Error {
    case cannotCast
    case notInt
    case notBC
}

while(true) {
    print("윤년을 검사할 년도를 입력하시고, 그만하려면 0을 입력하세요.")
       
    guard let aYear = Int(readLine()!) else {
        print("문자는 입력할 수 없습니다.\n")
        continue
    }
                
    
    if (aYear == 0) {
        break
    } else if(aYear < 0) {
        print("자연수를 입력하세요.\n")
    } else {
        isLeap(year: aYear)
    }

}

func isLeap(year: Int) {
    // 1. The year is exactly divisible by four (with no reminder) then it is a leap year, unless:
    // 2. If the year is also divisible by 100 (years ending in two zeros), then it is not a leap year, except if
    // 3. It is also divisible by 400 (in this case it will be a leap year).
    if(year % 400 == 0) {
        print("YES, \(year) is Lear Year.\n")
    } else if((year % 4 == 0) && (year % 100 != 0)) {
        print("YES, \(year) is Lear Year.\n")
    } else {
        print("NO, \(year) is Common Year.\n")
    }
}

// test
//isLeap(year: 100) // NO
//isLeap(year: 200) // NO
//isLeap(year: 204) // YES
//isLeap(year: 400) // YES
//isLeap(year: 600) // NO
//isLeap(year: 800) // YES

