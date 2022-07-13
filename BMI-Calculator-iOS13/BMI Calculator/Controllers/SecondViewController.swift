//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by 박새별 on 2022/07/13.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

// It looks like 'createHTMLDocument', 'createElement', 'createTextNode', and 'appendChild'.
class SecondViewController: UIViewController {

    var bmiValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create UILabel Instance
        let label = UILabel()

        // Set test
        guard let bmiValue = bmiValue else {
            fatalError("guard failure handling has not been implemented")
        }
        label.text = bmiValue

        // Set frame
        label.frame = CGRect(x: 50, y: 100, width: 200, height: 100)

        // Add child to the View that will be parent.
        view.addSubview(label)

        // UIColor will be omitted
//        view.backgroundColor = UIColor.purple
        view.backgroundColor = .purple

    }

}
