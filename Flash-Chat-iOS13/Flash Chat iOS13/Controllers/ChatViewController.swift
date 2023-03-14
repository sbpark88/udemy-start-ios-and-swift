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
    var tableScrollAnimation = false
    
    var message: [Message] = []
    var messageSender: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        title = K.appName
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        let _ = Auth.auth().addStateDidChangeListener { auth, user in
            guard let messageSender = user?.email else { return }
            self.messageSender = messageSender
        }
        
        pullFromFirestore()
        tableScrollAnimation = true
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
        self.pushToFirestore(messageSender: self.messageSender, messageBody: messageBody)
    }
    
}

// MARK: Push/Pull Messages
extension ChatViewController {
    private func pushToFirestore(messageSender: String, messageBody: String) {
        db.collection(K.FStore.collectionName).addDocument(data: [
            K.FStore.senderField: messageSender,
            K.FStore.bodyField: messageBody,
            K.FStore.dateField: Date().timeIntervalSince1970
        ]) { [unowned self] error in
            if let error {
                print("There was an issue saving data to Firestore, \(error)")
            } else {
                print("Successfully saved data.")
                DispatchQueue.main.async {
                    self.messageTextfield.text = ""
                }
            }
        }
    }
    
    private func pullFromFirestore() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { documentSnapshot, error in
                if let error {
                    print("There was an issue retrieving data from Firestore, \(error)")
                } else {
                    self.message = []
                    documentSnapshot?.documents.forEach {
                        let data = $0.data()
                        guard let messageSender = data[K.FStore.senderField] as? String,
                              let messageBody = data[K.FStore.bodyField] as? String
                        else { return }
                        self.message.append(Message(sender: messageSender, body: messageBody))
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        let indexPath = IndexPath(row: self.message.count - 1, section: 0)
                        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
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
        let message = message[indexPath.row]
        let sender: Sender = message.sender == messageSender ? .me : .you
        
        cell.label.text = message.body
        changeDesign(sender: sender)
        
        return cell
        
        // MARK: tableView nested data
        func changeDesign(sender: Sender) {
            if sender == .me {
                cell.leftImageView.isHidden = true
                cell.rightImageView.isHidden = false
                cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
                cell.label.textColor = UIColor(named: K.BrandColors.purple)
            } else {
                cell.leftImageView.isHidden = false
                cell.rightImageView.isHidden = true
                cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
                cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
            }
        }
        
        enum Sender {
            case you, me
        }
    }
    
}
