//
//  CategoryViewController.swift
//  Todoey
//
//  Created by 박새별 on 2023/03/28.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController, TintSettings {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTintColor()
        loadCategory()
    }
    
    // MARK: TableView Manipulation Methods
    
    
    // MARK: Add New Categories
    // TODO: Extract to external structure
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var inputText = UITextField()
        
        let alert = UIAlertController(title: K.CategoryView.alert.title, message: "", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = K.CategoryView.alert.placeholder
            inputText = textField
        }
        
        let action = UIAlertAction(title: K.CategoryView.alert.button, style: .default) { action in
            guard let newCategory = inputText.text, !newCategory.isEmpty else { return }
            let category = Category(context: self.context)
            category.name = newCategory
            self.categories.append(category)
            
            self.saveCategory()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
}

// MARK: TableView Datasource Methods

extension CategoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CategoryView.cellName, for: indexPath)
        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category.name
        
        return cell
    }
}

// MARK: TableView Delegate Methods

extension CategoryViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(categories[indexPath.row])
    }
}

// MARK: Control Core Data

extension CategoryViewController {
    
    func saveCategory() {
        // TODO: Save the data into Core Data
        tableView.reloadData()
    }
    
    func loadCategory(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching data from context\(error)")
        }
        tableView.reloadData()
    }
    
    func deleteCategory(_ category: Category) {
        // TODO: Delete the data from Core Data
        tableView.reloadData()
    }
    
}
