//
//  CategoryViewController.swift
//  Todoey
//
//  Created by 박새별 on 2023/03/28.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit

class CategoryViewController: UITableViewController, TintSettings {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTintColor()
        loadCategory()
        tableView.rowHeight = 80.0
    }
    
    // MARK: TableView Manipulation Methods
    
    
    // MARK: Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var inputText = UITextField()
        
        let alert = UIAlertController(title: K.CategoryView.alert.title, message: "", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = K.CategoryView.alert.placeholder
            inputText = textField
        }
        
        let action = UIAlertAction(title: K.CategoryView.alert.button, style: .default) { [weak self] action in
            guard let newCategory = inputText.text, !newCategory.isEmpty else { return }
            let category = Category()
            category.name = newCategory
            
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
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CategoryView.cellName, for: indexPath) as! SwipeTableViewCell
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        cell.delegate = self
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
    
    // Replace to Swipe Cell Kit
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, true) in
//            guard let deleteTarget = self?.categories?[indexPath.row] else { return }
//            self?.deleteCategory(deleteTarget)
//        }
//        deleteAction.backgroundColor = .red
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//        configuration.performsFirstActionWithFullSwipe = false
//        return configuration
//    }
    
}

// MARK: Swipe Cell Delegate Methods

extension CategoryViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { [weak self] action, indexPath in
            // handle action by updating model with deletion
            guard let deleteTarget = self?.categories?[indexPath.row] else { return }
            do {
                try self?.realm.write {
                    self?.realm.delete(deleteTarget)
                }
            } catch {
                print("Error deleting from realm, \(error)")
            }
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
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
