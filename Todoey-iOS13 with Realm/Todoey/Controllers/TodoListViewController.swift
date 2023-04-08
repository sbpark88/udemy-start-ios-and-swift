//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class TodoListViewController: UITableViewController, UISearchBarDelegate, UIPickerViewDelegate, UIImagePickerControllerDelegate, TintSettings {
    
    var todoeyItems: Results<TodoeyItem>?
    let realm = try! Realm()
    
    var selectedCategory: Category? {
        didSet {
            loadTodoey()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTintColor()
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
            guard let parentCategory = self?.selectedCategory else { return }
            guard let newTodoey = inputText.text, newTodoey != "" else { return }
            do {
                try self?.realm.write {
                    let todoey = TodoeyItem()
                    todoey.title = newTodoey
                    parentCategory.items.append(todoey)
                }
            } catch {
                print("Error saving new items, \(error)")
            }
            
            self?.tableView.reloadData()
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
        todoeyItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.TodoListView.cellName, for: indexPath)
        if let item = todoeyItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Toeody Added Yet"
        }
        
        return cell
    }
}

// MARK: Tableview Delegate Methods

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let todoeyItem = todoeyItems?[indexPath.row] else { return }
        do {
            try realm.write {
                todoeyItem.done = !todoeyItem.done
            }
        } catch {
            print("Error saving done status, \(error)")
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, true) in
            guard let deleteTarget = self?.todoeyItems?[indexPath.row] else { return }
            
            do {
                try self?.realm.write {
                    self?.realm.delete(deleteTarget)
                }
                
            } catch {
                print("Error deleting from realm, \(error)")
            }
            tableView.reloadData()
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}

// MARK: Control Realm

extension TodoListViewController {
    
    func loadTodoey() {
        todoeyItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
    }
    
}

// MARK: UISearchBar

extension TodoListViewController {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //        let request: NSFetchRequest<TodoeyItem> = TodoeyItem.fetchRequest()
        //        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        //        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        //
        //        loadTodoey(with: request, predicate: predicate)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            //            loadTodoey()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        } else {
            searchBarSearchButtonClicked(searchBar)
        }
    }
    
}
