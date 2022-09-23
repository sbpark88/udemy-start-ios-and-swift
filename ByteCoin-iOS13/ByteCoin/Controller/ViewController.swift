//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!

    var coinManager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
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
        coinManager.currencyArray.count
    }
}

// MARK: UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    // Set pickerView title of each selection.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }

    // What do you do after selecting an item?
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
        currencyLabel.text = selectedCurrency
    }
}

// MARK: CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    func coinManager(_ manager: CoinManager, didUpdateCoin coinData: CoinData) {
        DispatchQueue.main.async { [self] in
            bitcoinLabel.text = String(format: "%.2f", coinData.rate)
        }
    }
    func coinManager(_ manager: CoinManager, didFailWithError error: Error) {
        DispatchQueue.main.async { [self] in
            bitcoinLabel.text = "Error 😫 "
        }
        print(error)
    }
}
