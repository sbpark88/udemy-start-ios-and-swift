//
//  TodoeyItem.swift
//  Todoey
//
//  Created by 박새별 on 2023/04/02.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import RealmSwift

class TodoeyItem: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
