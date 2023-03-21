//
//  TodoeyItem.swift
//  Todoey
//
//  Created by 박새별 on 2023/03/22.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

class Item: Encodable {
    
    var title: String
    var done: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
