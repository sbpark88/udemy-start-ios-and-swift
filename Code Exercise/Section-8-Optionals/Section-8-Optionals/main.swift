//
//  main.swift
//  Section-8-Optionals
//
//  Created by 박새별 on 2022/06/23.
//

import Foundation

//Don't change this
print("Enter the scores for Amy, Janmes, and Helen in that order.")
var studentsAndScores = ["Amy": Int(readLine()!)!, "James": Int(readLine()!)!, "Helen": Int(readLine()!)!]

print("--------------------------------------")

func highestScore(scores: [String: Int]) {

    //Write your code here.
    let sortedScores = scores.sorted(by: {$0.value > $1.value})
    print(sortedScores.first?.value ?? "")
    
    print(scores.values.max()!)
    
    let maxScore = scores.values.max()
    if maxScore != nil {
        print(maxScore!)
    }
    
    if let max = scores.values.max() {
        print(max)
    }
}

highestScore(scores: studentsAndScores)


