//
//  Constants.swift
//  Todoey
//
//  Created by 박새별 on 2023/03/21.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import SwiftUI

struct K {
    struct FileManager {
        static let todoList = "TodoList.plist"
    }
    
    struct CategoryView {
        static let cellName = "CategoryCell"
        
        struct alert {
            static let title = "Add New Todoey Category"
            static let placeholder = "Create new category"
            static let button = "Add Category"
        }
    }
    
    struct TodoListView {
        static let cellName = "ToDoItemCell"
        
        struct alert {
            static let title = "Add New Todoey Item"
            static let placeholder = "Create new item"
            static let button = "Add Item"
        }
    }
}
