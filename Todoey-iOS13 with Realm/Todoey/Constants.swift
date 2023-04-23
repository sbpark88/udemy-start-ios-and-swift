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
        struct Alert {
            static let title = "Add New Todoey Category"
            static let placeholder = "Create new category"
            static let button = "Add Category"
        }
    }
    
    struct TodoListView {
        struct Alert {
            static let title = "Add New Todoey Item"
            static let placeholder = "Create new item"
            static let button = "Add Item"
        }
    }
    
    struct Colour {
        struct Cell {
            static let defaultColor = "1D9BF6"
        }
    }
    
    struct Segue {
        static let categoryViewToTodoListView = "goToItems"
    }
}
