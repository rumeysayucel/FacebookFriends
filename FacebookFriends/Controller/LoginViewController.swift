//
//  ViewController.swift
//  FacebookFriends
//
//  Created by Rumeysa Yücel on 4.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var showingAlert = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 15
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if usernameTextField.text == "brownpeacock226" && passwordTextField.text == "hayabusa" {
            self.performSegue(withIdentifier: "LoginToList", sender: self)
        }else {
            self.showAlert()
        }
    }
    
    func showAlert() {
        
        showingAlert = true
        
        let showingAlert = UIAlertController(title: "Fault!", message:
                "Please check your username and password.", preferredStyle: .alert)
            showingAlert.addAction(UIAlertAction(title: "Close", style: .default))

            self.present(showingAlert, animated: true, completion: nil)
    }
}

