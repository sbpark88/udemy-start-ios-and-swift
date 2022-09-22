//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func coinManager(_ manager: CoinManager, didUpdateCoin coinData: CoinData)
    func coinManager(_ manager: CoinManager, didFailWithError error: Error)
}

struct CoinManager {

    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    var apiKey: String {
        ApiKey().apiKey
    }
    let currencyArray = ["AUD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "IDR", "ILS", "INR", "JPY", "KRW", "MXN", "NOK", "NZD", "PLN", "RON", "RUB", "SEK", "SGD", "USD", "ZAR"]

    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)"
        performRequest(with: url)
    }

    private func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")   // Notice to sequence! 'value-key' pair, not 'key-value' pair.

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
                    if let error = error {
                        print(error)
                        return
                    }
                    guard let safeData = data else { return }
                    guard let coinData = parseJson(safeData) else { return }
                    delegate?.coinManager(self, didUpdateCoin: coinData)
                })
                .resume()
    }

    private func parseJson(_ coinData: Data) -> CoinData? {
        // Method 1. Using JSON Serialization without 'Codable'
        /*do {
            let jsonResult = try JSONSerialization.jsonObject(with: coinData, options: .mutableContainers) as? [String: Any]
            let time: String = jsonResult?["time"] as! String
            let coin: String = jsonResult?["asset_id_base"] as! String
            let currency: String = jsonResult?["asset_id_quote"] as! String
            let rate: Double = jsonResult?["rate"] as! Double
            let coinData = CoinData(time: time, coin: coin, currency: currency, rate: rate)
            return coinData
        } catch {
            delegate?.coinManager(self, didFailWithError: error)
            return nil
        }*/

        // Method 2. Using JSON Decoder with 'Codable'
        let decoder = JSONDecoder()
        do {
            let coinData = try decoder.decode(CoinData.self, from: coinData)
            return coinData
        } catch {
            delegate?.coinManager(self, didFailWithError: error)
            return nil
        }
    }

}
