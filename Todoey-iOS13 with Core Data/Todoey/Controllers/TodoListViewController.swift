//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController, UISearchBarDelegate, UIPickerViewDelegate, UIImagePickerControllerDelegate, TintSettings {
    
    var itemArray = [TodoeyItem]()
    
    var selectedCategory: Category? {
        didSet {
            loadTodoey()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTintColor()
        loadTodoey()
    }
    
    @IBAction func AddTodoey(_ sender: UIBarButtonItem) {
        
        var inputText = UITextField()
        
        // < Modal Header >
        // likes document.createElement()
        let alert = UIAlertController(title: K.TodoListView.alert.title, message: "", preferredStyle: .alert)
        
        // < Modal Body >
        // likes element.setAttribute('attribute', 'value')
        alert.addTextField { textField in // likes <input type="text" placeholder="Create new item">
            textField.placeholder = K.TodoListView.alert.placeholder
            inputText = textField
        }
        
        // Modal Footer Button
        // just function
        let action = UIAlertAction(title: K.TodoListView.alert.button, style: .default) { [weak self] action in
            // what will happen once the user clicks the Add Todoey button on our UIAlert
            guard let newTodoey = inputText.text, newTodoey != "" else { return }
            let item = TodoeyItem(context: self!.context)
            item.title = newTodoey
            item.parentCategory = self?.selectedCategory
            self?.itemArray.append(item)
            
            self?.saveTodoey()
        }
        
        // likes element.addEventListener('click', () => {}), in this case, element.addEventListener('click', action)
        alert.addAction(action)
        
        // likes element.appendChild(), in this case, element.appendChild(alert)
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK - Tableview Datasource Methods

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.TodoListView.cellName, for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // Must use 'cell.accessoryType', not 'tableView.cellForRow(at: indexPath)?.accessoryType'
        //        tableView.cellForRow(at: indexPath)?.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
}

// MARK: Tableview Delegate Methods

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveTodoey()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, true) in
            guard let deleteTarget = self?.itemArray[indexPath.row] else { return }
            self?.itemArray.remove(at: indexPath.row)
            self?.deleteTodoey(deleteTarget)
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}

// MARK: Control Core Data

extension TodoListViewController {
    
    func saveTodoey() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    func loadTodoey(with request: NSFetchRequest<TodoeyItem> = TodoeyItem.fetchRequest(), predicate: NSPredicate? = nil) {
        let defaultPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        if let predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [defaultPredicate, predicate])
        } else {
            request.predicate = defaultPredicate
        }
        
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        tableView.reloadData()
    }
    
    func deleteTodoey(_ todoey: TodoeyItem) {
        do {
            context.delete(todoey)
            try context.save()
        } catch {
            print("Error delete data from context \(error)")
        }
        tableView.reloadData()
    }
    
}

// MARK: UISearchBar

extension TodoListViewController {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<TodoeyItem> = TodoeyItem.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        loadTodoey(with: request, predicate: predicate)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadTodoey()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        } else {
            searchBarSearchButtonClicked(searchBar)
        }
    }
    
}
