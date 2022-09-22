//
// Created by 박새별 on 2022/09/22.
// Copyright (c) 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {

    let time: String
    let coin: String
    let currency: String
    let rate: Double

    // Key mapping when key names are different between two data.

    enum CodingKeys: String, CodingKey {
        case time
        case coin = "asset_id_base"
        case currency = "asset_id_quote"
        case rate
    }

}
