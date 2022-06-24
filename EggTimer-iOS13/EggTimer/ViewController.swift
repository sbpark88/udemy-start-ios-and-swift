//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer = Timer()
    let eggTime: [String: Int] = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]

    @IBAction func pressButton(_ sender: UIButton) {

        let eggTimeTitle = sender.currentTitle!
        //        print(eggTime[eggTimeTitle] ?? "Error")

        if eggTimeTitle == "Hard" {
            // Solution 1
            // Optional biniding(unwrap) using guard
            // This looks like more EAFP(“It’s Easier to Ask Forgiveness than Permission”) for me.
            guard let time = eggTime[eggTimeTitle] else {
                return
            }
            startTimer(time: time)
        } else {
            // Solution 2
            // Optional biniding(unwrap) using if
            // This looks like more LBYL(Look Before You Leap) for me.
            if let time = eggTime[eggTimeTitle] {
                startTimer(time: time)
            }
        }
    }

    private func startTimer(time: Int) {
        var remainTime = time

        // Make previous trigger expired.
        timer.invalidate()
        printTimer(time: remainTime)
        if time > 10 {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { Timer in
                if remainTime > 1 {
                    remainTime -= 1
                    self.printTimer(time: remainTime)
                } else {
                    print("0! Enjoy yourself~~")
                    Timer.invalidate()
                }
            })
        } else {
            // This code same with in if clause. We can extract closures instead of block parameters in 'Time.scheduledTimer'
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
                if remainTime > 1 {
                    remainTime -= 1
                    self.printTimer(time: remainTime)
                } else {
                    print("0! Enjoy yourself~~")
                    Timer.invalidate()
                }
            }
        }
    }

    private func printTimer(time: Int) {
//        print(time, " seconds")
        print("\(time) seconds")
    }
}
