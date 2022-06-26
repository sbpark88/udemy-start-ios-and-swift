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

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressText: UILabel!

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
        let totalTime: Float = Float(time) // * 60
        var remainTime = time // * 60

        // Init. Make previous trigger expired.
        timer.invalidate()
        progressBar.progress = 0

        // Execute only one they are started.
        setTitleText(text: "The eggs are being bioled.")
        progressText.text = "\(remainTime) secodns"

        if time > 10 {
            // Solution 1
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { Timer in
                remainTime -= 1
                proceedProgressBar(time: remainTime)
                if remainTime == 0 {
                    self.setTitleText(text: "Enjoy yourself!")
                    Timer.invalidate()
                }
            })
        } else {
            // Solution 2
            // This code same with in if clause. We can extract closures instead of block parameters in 'Time.scheduledTimer'
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] Timer in
                remainTime -= 1
                proceedProgressBar(time: remainTime)
                if remainTime == 0 {
                    setTitleText(text: "Enjoy yourself!")
                    Timer.invalidate()
                }
            }
        }

        func proceedProgressBar(time: Int) {
            progressText.text = time != 0 ? "\(time) secodns" : "Done!"
            progressBar.progress += 1 / totalTime
        }
    }

    func setTitleText(text: String) {
        titleLable.text = text
    }

}
