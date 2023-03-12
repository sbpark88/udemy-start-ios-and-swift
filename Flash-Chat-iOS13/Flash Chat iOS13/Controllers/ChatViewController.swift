//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var messageTextfield: UITextField!

    var message: [Message] = [
        Message(sender: "1@2.coom", body: "Hey!"),
        Message(sender: "3@aa.coom", body: "Hello!"),
        Message(sender: "1@2.coom", body: "What's Up!"),
        Message(sender: "3@aa.coom", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ut ex eu urna gravida iaculis. Nulla facilisis ipsum congue elit rhoncus, nec ultrices est maximus. Fusce ornare feugiat enim sit amet tempor.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        title = K.appName

        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }

    @IBAction private func sendPressed(_ sender: UIButton) {
    }

    @IBAction func signOutPress(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %0", signOutError)
        }
    }
}

// MARK: tableView
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        message.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as? MessageCell else { return MessageCell() }

        cell.label.text = message[indexPath.row].body
        return cell
    }

}
