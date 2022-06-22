//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
        
    @IBAction func pressButton(_ sender: UIButton) {
        
        var hardness: Any

        switch sender.currentTitle! {
        case "Soft":
            hardness = softTime
            break
        case "Medium":
            hardness = mediumTime
            break
        case "Hard":
            hardness = hardTime
            break
        default:
            hardness = "Error"
        }

        print(hardness)

    }

}
