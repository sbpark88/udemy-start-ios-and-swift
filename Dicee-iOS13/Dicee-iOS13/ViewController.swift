//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        changeDiceImage(imageView: diceImageViewOne, imageName: "DiceSix")
        changeDiceImage(imageView: diceImageViewTwo, imageName: "DiceTwo")

        diceImageViewOne.alpha = 0.5
    }

    private func changeDiceImage(imageView: UIImageView, imageName: String) {
        imageView.image = #imageLiteral(resourceName: imageName)
    }

}

