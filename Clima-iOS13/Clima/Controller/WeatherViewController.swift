//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!

    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

}

// MARK: UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {

    @IBAction func searchPressed(_ sender: Any) {
        searchTextField.endEditing(true)
    }

    // Asks the delegate whether to process the pressing of the Return button for the text field.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
//        textField.endEditing(true)  // equal
        return true
    }

    // Asks the delegate whether to stop editing in the specified text field.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {

            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }

    // Tells the delegate when editing stops for the specified text field.
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            weatherManager.fetchWeather(city)
        }
        searchTextField.text = ""
    }

}

// MARK: WeatherManagerDegate

extension WeatherViewController: WeatherManagerDelegate {

    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async { [self] in
            conditionImageView.image = UIImage(named: weather.conditionName)
            temperatureLabel.text = weather.temperatureString
            cityLabel.text = weather.cityName
        }
    }

    func didFailWithError(error: Error) {
        print(error)
    }

}
