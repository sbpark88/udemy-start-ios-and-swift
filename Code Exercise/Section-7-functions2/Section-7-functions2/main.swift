//
//  main.swift
//  Section-7-functions2
//
//  Created by 박새별 on 2022/06/17.
//

import Foundation


//Don't change this code:
func calculator() {
  let a = Int(readLine()!)! //First input
  let b = Int(readLine()!)! //Second input

  add(n1: a, n2: b)
  subtract(n1: a, n2: b)
  multiply(n1: a, n2: b)
  divide(n1: a, n2: b)

}


//Write your code below this line to make the above function calls work.
calculator()

