//
//  main.swift
//  Section-7-functions2
//
//  Created by 박새별 on 2022/06/17.
//

import Foundation


//Don't change this code:
func calculator() {
    print("첫 번째 정수를 입력해주세요.")
    let a = Int(readLine()!)! //First input
    print("두 번째 정수를 입력해주세요.")
    let b = Int(readLine()!)! //Second input
    print("")
    
    add(n1: a, n2: b)
    subtract(n1: a, n2: b)
    multiply(n1: a, n2: b)
    divide(n1: a, n2: b)
    
}

func add(n1: Int, n2: Int) -> Void { print("n1 + n2 = \(n1 + n2)") }
func subtract(n1: Int, n2: Int) -> Void { print("n1 - n2 = \(n1 - n2)") }
func multiply(n1: Int, n2: Int) -> Void { print("n1 * n2 = \(n1 * n2)") }
func divide(n1: Int, n2: Int) -> Void { print("n1 / n2 = \(Double(n1) / Double(n2))") }

//Write your code below this line to make the above function calls work.
calculator()

