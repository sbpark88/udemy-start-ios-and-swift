//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
//    var itemArray = [String]()
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTintColor()
        
        itemArray.append(Item(title: "A"))
        itemArray.append(Item(title: "B"))
        itemArray.append(Item(title: "C"))
        itemArray.append(Item(title: "D"))
        itemArray.append(Item(title: "E"))
        itemArray.append(Item(title: "F"))
        itemArray.append(Item(title: "G"))
        itemArray.append(Item(title: "H"))
        itemArray.append(Item(title: "I"))
        itemArray.append(Item(title: "J"))
        itemArray.append(Item(title: "K"))
        itemArray.append(Item(title: "L"))
        itemArray.append(Item(title: "M"))
        itemArray.append(Item(title: "N"))
        itemArray.append(Item(title: "O"))
        itemArray.append(Item(title: "P"))
        itemArray.append(Item(title: "Q"))
        itemArray.append(Item(title: "R"))
        itemArray.append(Item(title: "S"))
        itemArray.append(Item(title: "T"))
        itemArray.append(Item(title: "U"))
        itemArray.append(Item(title: "V"))
        itemArray.append(Item(title: "W"))
        itemArray.append(Item(title: "Z"))
        itemArray.append(Item(title: "Y"))
        itemArray.append(Item(title: "Z"))
        
        
//        if let stored = defaults.array(forKey: K.UserDefaults.todoList) as? [String] {
//            itemArray = stored
//        }
        
    }
    
    @IBAction func AddTodoey(_ sender: UIBarButtonItem) {
        
        var inputText = UITextField()
        
        // < Modal Header >
        // likes document.createElement()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        // < Modal Body >
        // likes element.setAttribute('attribute', 'value')
        alert.addTextField { textField in   // likes <input type="text" placeholder="Create new item">
            textField.placeholder = "Create new item"
            inputText = textField
        }
        
        // Modal Footer Button
        // just function
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // what will happen once the user clicks the Add Todoey button on our UIAlert
            guard let newTodoey = inputText.text, inputText.text != "" else { return }
            self.itemArray.append(Item(title: newTodoey))
            self.defaults.set(self.itemArray, forKey: K.UserDefaults.todoList)
            self.tableView.reloadData()
        }
        
        // likes element.addEventListener('click', () => {}), in this case, element.addEventListener('click', action)
        alert.addAction(action)
        
        // likes element.appendChild(), in this case, element.appendChild(alert)
        present(alert, animated: true, completion: nil)
        
    }
    
}

// MARK: Set Tint Color

extension TodoListViewController {
    func setTintColor() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.cyan
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}

// MARK - Tableview Datasource Methods

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
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
        tableView.reloadData()  // !important, this call 'Tableview Datasource Methods'
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
