//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {

    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    var apiKey: String {
        ApiKey().apiKey
    }
    let currencyArray = ["AUD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "IDR", "ILS", "INR", "JPY", "KRW", "MXN", "NOK", "NZD", "PLN", "RON", "RUB", "SEK", "SGD", "USD", "ZAR"]

    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)"
        performRequest(with: url)
    }

    private func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")   // Notice to sequence! 'value-key' pair, not 'key-value' pair.

        URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print(error)
                        return
                    }

                    guard let safeData = data else { return }
                    print(String(data: safeData, encoding: .utf8) as Any)
                }
                .resume()
    }

}
