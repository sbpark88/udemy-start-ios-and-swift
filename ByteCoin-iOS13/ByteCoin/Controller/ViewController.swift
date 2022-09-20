//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UIView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!

    var coinMnagager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }

}

// MARK: UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {

    // How many pickers do you provide for?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    // What is the length of the pickers?
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinMnagager.currencyArray.count
    }

}

// MARK: UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinMnagager.currencyArray[row]
    }
}

