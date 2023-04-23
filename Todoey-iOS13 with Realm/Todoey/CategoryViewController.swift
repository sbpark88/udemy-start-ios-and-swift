//
//  CategoryViewController.swift
//  Todoey
//
//  Created by 박새별 on 2023/03/28.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategory()
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
    }
    
    // MARK: Delete Data From Swipe
    
    override func updateModel(at indexPath: IndexPath) {
        // handle action by updating model with deletion
        guard let deleteTarget = self.categories?[indexPath.row] else { return }
        do {
            try self.realm.write {
                self.realm.delete(deleteTarget)
            }
        } catch {
            print("Error deleting from realm, \(error)")
        }
    }
    
    // MARK: Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var inputText = UITextField()
        
        let alert = UIAlertController(title: K.CategoryView.Alert.title, message: "", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = K.CategoryView.Alert.placeholder
            inputText = textField
        }
        
        let action = UIAlertAction(title: K.CategoryView.Alert.button, style: .default) { [weak self] action in
            guard let newCategory = inputText.text, !newCategory.isEmpty else { return }
            let category = Category()
            category.name = newCategory
            category.colour = UIColor.randomFlat().hexValue()
            
            self?.save(category: category)
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
}

// MARK: TableView Datasource Methods

extension CategoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        cell.contentView.backgroundColor = UIColor(hexString: categories?[indexPath.row].colour ?? K.Colour.Cell.defaultColor)
        cell.textLabel?.textColor = ContrastColorOf(cell.contentView.backgroundColor!, returnFlat: true)
        return cell
    }
}

// MARK: TableView Delegate Methods

extension CategoryViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.Segue.categoryViewToTodoListView, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        destinationVC.selectedCategory = categories?[indexPath.row]
    }
    
}

// MARK: Control Realm

extension CategoryViewController {
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving realm \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategory() {
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }
    
}
