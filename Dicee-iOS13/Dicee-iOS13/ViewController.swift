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

        // change to functional programming
        changeDiceImage(imageView: diceImageViewOne, imageName: "DiceSix")
        changeDiceImage(imageView: diceImageViewTwo, imageName: "DiceTwo")

        // change to closure
        let halfOpacity: () -> () = setOpacity(imageView: diceImageViewOne, opacityRatio: 0.5);
        halfOpacity();
        let eightyOpacity: () -> () = setOpacity(imageView: diceImageViewTwo, opacityRatio: 0.8);
        eightyOpacity();
    }

    private func changeDiceImage(imageView: UIImageView, imageName: String) {
        imageView.image = #imageLiteral(resourceName: imageName)
    }

    private func setOpacity(imageView: UIImageView, opacityRatio: Float) -> () -> () {
        func set() {
            imageView.alpha = CGFloat(opacityRatio)
        }

        return set;
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        changeDiceImage(imageView: diceImageViewOne, imageName: "DiceFour")
    
        let diceOneFullyOpacity: () -> () = setOpacity(imageView: diceImageViewOne, opacityRatio: 1.0)
        diceOneFullyOpacity()
    }
    
}

