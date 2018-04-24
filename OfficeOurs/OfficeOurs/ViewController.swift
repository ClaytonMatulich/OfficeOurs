//
//  ViewController.swift
//  OfficeOurs
//
//  Created by Clayton Matulich on 4/21/18.
//  Copyright © 2018 Clayton Matulich. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import ChameleonFramework

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    


    
    
    var ref: DatabaseReference!
    var handle: AuthStateDidChangeListenerHandle?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 20
        loginButton.clipsToBounds = true
        
        self.hideKeyboardWhenTappedAround()
        emailTextField.delegate = self
        emailTextField.tag = 0
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
        }
        // [END auth_listener]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
        // remove_auth_listener]
    }

    @IBAction func pressedLoginButton(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                print(error!)
            }else{
                print("Login Successfull")
                self.performSegue(withIdentifier: "login", sender: self)
            }
        }
    }
    
    func setUpTextFields(){    // sets up text fields to be able to interact with textFieldShouldReturn
        emailTextField.delegate = self
        emailTextField.tag = 0
        
        passwordTextField.delegate = self
        passwordTextField.tag = 1
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool  //when return button is pressed, move to next textfield
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }

    
}

//ads functionality to UIViewController to dismiss keyboard upon tap
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}









