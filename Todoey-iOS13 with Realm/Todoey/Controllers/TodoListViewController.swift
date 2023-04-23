//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class TodoListViewController: SwipeTableViewController, UISearchBarDelegate, UIPickerViewDelegate, UIImagePickerControllerDelegate {

    var todoeyItems: Results<TodoeyItem>?
    let realm = try! Realm()

    @IBOutlet weak var searchBar: UISearchBar!

    var selectedCategory: Category? {
        didSet {
            loadTodoey()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
        let categoryColour = UIColor(hexString: selectedCategory!.colour)
        setTintColor(backgroundColor: categoryColour,
                     titleTextColor: ContrastColorOf(categoryColour!, returnFlat: true))
        tableView.backgroundColor = categoryColour
//        title = selectedCategory!.name    // 여기다 써도 되는데 다른 viewWillAppear 에 넣어보자...
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let selectedCategory else { return }
        title = selectedCategory.name
        let categoryColour = UIColor(hexString: selectedCategory.colour)
        searchBar.barTintColor = categoryColour
    }

    // MARK: Delete Data From Swipe

    override func updateModel(at indexPath: IndexPath) {
        guard let deleteTarget = self.todoeyItems?[indexPath.row] else { return }
        do {
            try self.realm.write {
                self.realm.delete(deleteTarget)
            }
        } catch {
            print("Error deleting from realm, \(error)")
        }
    }

    @IBAction func AddTodoey(_ sender: UIBarButtonItem) {

        var inputText = UITextField()

        // < Modal Header >
        // likes document.createElement()
        let alert = UIAlertController(title: K.TodoListView.Alert.title, message: "", preferredStyle: .alert)

        // < Modal Body >
        // likes element.setAttribute('attribute', 'value')
        alert.addTextField { textField in // likes <input type="text" placeholder="Create new item">
            textField.placeholder = K.TodoListView.Alert.placeholder
            inputText = textField
        }

        // Modal Footer Button
        // just function
        let action = UIAlertAction(title: K.TodoListView.Alert.button, style: .default) { [weak self] action in
            // what will happen once the user clicks the Add Todoey button on our UIAlert
            guard let parentCategory = self?.selectedCategory else { return }
            guard let newTodoey = inputText.text, newTodoey != "" else { return }
            do {
                try self?.realm.write {
                    let todoey = TodoeyItem()
                    todoey.title = newTodoey
                    todoey.dateCreated = Date()
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

// MARK: Tableview Datasource Methods

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoeyItems?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let parentCategory = self.selectedCategory, let item = todoeyItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none

            // Style
            let darkenessRatio = CGFloat(indexPath.row) / CGFloat(todoeyItems?.count ?? 1) * 0.6  // Prevent getting too dark
            cell.backgroundColor = UIColor(hexString: parentCategory.colour)?.darken(byPercentage: darkenessRatio)
            cell.textLabel?.textColor = ContrastColorOf(cell.backgroundColor!, returnFlat: true)
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

}

// MARK: Control Realm

extension TodoListViewController {

    func loadTodoey() {
        todoeyItems = selectedCategory?.items.sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
    }

}

// MARK: UISearchBar

extension TodoListViewController {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        todoeyItems = todoeyItems?.filter("title CONTAINS[cd] %@", searchBar.text!)
            .sorted(byKeyPath: "dateCreated", ascending: true)

        tableView.reloadData()
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

