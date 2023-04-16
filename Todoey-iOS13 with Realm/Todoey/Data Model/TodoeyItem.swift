//
//  TodoeyItem.swift
//  Todoey
//
//  Created by 박새별 on 2023/04/02.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import RealmSwift

class TodoeyItem: Object {
    @Persisted var title: String = ""
    @Persisted var done: Bool = false
    @Persisted var dateCreated: Date?
    @Persisted(originProperty: "items") var parentCategory: LinkingObjects<Category>
}
