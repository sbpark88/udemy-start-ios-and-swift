//
//  Category.swift
//  Todoey
//
//  Created by 박새별 on 2023/04/02.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import RealmSwift

class Category: Object {
    @Persisted var name: String = ""
    @Persisted var items: List<TodoeyItem>
}
