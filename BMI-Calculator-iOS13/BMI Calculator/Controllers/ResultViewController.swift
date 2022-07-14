//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by 박새별 on 2022/07/14.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!

    var bmiValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let bmiValue = bmiValue else {
            fatalError("guard failure handling has not been implemented")
        }
        bmiLabel.text = bmiValue
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
