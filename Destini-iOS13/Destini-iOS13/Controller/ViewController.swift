//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet var choiceButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressChoiceButton(_ sender: Any) {
        choiceButtons.enumerated().forEach { (index: Int, button: UIButton) in
            if index == 0 {
                button.setTitle("Click", for: .normal)
                button.backgroundColor = .none ?? nil ?? UIColor.clear
            }
        }
    }
}

