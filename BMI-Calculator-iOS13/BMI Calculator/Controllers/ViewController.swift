//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    var bodyInfo: [UILabel] = []
    var bmi: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        bodyInfo = [heightLabel, weightLabel]
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

    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value

        bmi = weight / pow(height / 100, 2)

        /*let secondVC = SecondViewController()
        secondVC.bmiValue = String(format: "%.1f", bmi)

        // Presents a view controller to modal.
        present(secondVC, animated: true)*/

        /* Initiates the segue with the specified identifier from the current view controller's storyboard file.
           identifier: The string that identifies the triggered segue.
                      In Interface Builder, you specify the segue’s identifier string in the attributes inspector.
                      This method throws an Exception handling  if there is no segue with the specified identifier.
           sender: The object that you want to use to initiate the segue.
                   This object is made available for informational purposes during the actual segue.
         */
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            // Down-casting
            // Force casts should be avoided. (SwiftLint: force_cast)
//            let destinationVC: ResultViewController = segue.destination as! ResultViewController
            guard let destinationVC: ResultViewController = segue.destination as? ResultViewController else {
                return
            }
            destinationVC.bmiValue = String(format: "%.1f", bmi)
        }
    }
}
