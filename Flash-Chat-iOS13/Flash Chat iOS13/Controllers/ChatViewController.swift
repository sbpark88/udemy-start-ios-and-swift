//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
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
        guard let messageBody = messageTextfield.text else { return }
        let handle = Auth.auth().addStateDidChangeListener {
            [unowned self]
            auth, user in
            if let _ = auth.currentUser, let messageSender = user?.email {
                self.db.collection(K.FStore.collectionName).addDocument(data: [
                    K.FStore.senderField: messageSender,
                    K.FStore.bodyField: messageBody,
                ]) { error in
                    if let error = error {
                        print("There was an issue saving data to firestore, \(error)")
                    } else {
                        print("Successfully saved data.")
                    }
                }
            }
        }
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
