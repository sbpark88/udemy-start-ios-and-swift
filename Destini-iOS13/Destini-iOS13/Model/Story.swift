//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let text: String
    let choices: [Choice]

    struct Choice {
        let choice: String
        let goTo: Int

        init(_ choice: String, _ goTo: Int) {
            self.choice = choice
            self.goTo = goTo
        }
    }

}
