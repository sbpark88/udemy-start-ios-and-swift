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
    
    var message: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        title = K.appName
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        pullFromFirestore()
        
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
    
    @IBAction private func sendPressed(_ sender: UIButton) {
        guard let messageBody = messageTextfield.text else { return }
        let _ = Auth.auth().addStateDidChangeListener { auth, user in
            guard let messageSender = user?.email else { return }
            self.pushToFirestore(messageSender: messageSender, messageBody: messageBody)
        }
        
    }
}

// MARK: Push/Pull Messages
extension ChatViewController {
    private func pushToFirestore(messageSender: String, messageBody: String) {
        db.collection(K.FStore.collectionName).addDocument(data: [
            K.FStore.senderField: messageSender,
            K.FStore.bodyField: messageBody
        ]) { [unowned self] error in
            if let error {
                print("There was an issue saving data to Firestore, \(error)")
            } else {
                print("Successfully saved data.")
                messageTextfield.text = ""
            }
        }
    }
    
    private func pullFromFirestore() {
        db.collection(K.FStore.collectionName).addSnapshotListener { documentSnapshot, error in
            if let error {
                print("There was an issue retrieving data from Firestore, \(error)")
            } else {
                self.message = []
                documentSnapshot?.documents.forEach {
                    let data = $0.data()
                    guard let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String else { return }
                    self.message.append(Message(sender: messageSender, body: messageBody))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
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
