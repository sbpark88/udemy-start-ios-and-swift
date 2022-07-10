//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!

    var bodyInfo: [UILabel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        bodyInfo = [heightLable, weightLable]
    }

    @IBAction func bodyInformationChanged(_ sender: UISlider) {
        updateUi(tag: sender.tag, measurement: sender.value)
    }

    private func updateUi(tag: Int, measurement: Float) {
//        let strMeasurement: String = String(round(measurement * 10) / 10)
        let strMeasurement: String = String(format: "%.1f", measurement)

        bodyInfo[tag].text = tag == 0
                ? "\(strMeasurement) cm"
                : "\(strMeasurement) kg"
    }

}
