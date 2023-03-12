//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak private var emailTextfield: UITextField!
    @IBOutlet weak private var passwordTextfield: UITextField!

    @IBAction private func loginPressed(_ sender: UIButton) {

        guard let email = emailTextfield.text, let password = passwordTextfield.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let err = error {
                print(err.localizedDescription)
            } else {
                // Navigate to the ChatViewController
                self?.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
        }
    }

}
