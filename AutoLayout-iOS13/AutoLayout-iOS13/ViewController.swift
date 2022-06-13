//
//  ViewController.swift
//  AutoLayout-iOS13
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    @IBAction func rollButtonPressed(_ sender: UIButton) {

        let allDice: Array<String> = ["DiceOne",
                                      "DiceTwo",
                                      "DiceThree",
                                      "DiceFour",
                                      "DiceFive",
                                      "DiceSix"]


        guard let element = allDice.randomElement() else {
            fatalError("guard failure handling has not been implemented")
        }
        changeDiceImage(imageView: diceImageView1, imageName: element)
        if let element = allDice.randomElement() {
            changeDiceImage(imageView: diceImageView2, imageName: element)
        }

    }

    private func changeDiceImage(imageView: UIImageView, imageName: String) {
        imageView.image = #imageLiteral(resourceName: imageName)
    }

}

