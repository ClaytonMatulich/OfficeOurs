//
//  StudentRegistrationViewController.swift
//  OfficeOurs
//
//  Created by Clayton Matulich on 4/21/18.
//  Copyright © 2018 Clayton Matulich. All rights reserved.
//

import UIKit
import Firebase

class StudentRegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var studentIDTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setUpTextFields()
        
        ///////UI
        submitButton.layer.cornerRadius = 20
        submitButton.clipsToBounds = true
        submitButton.layer.borderWidth = 1
        
        backButton.layer.cornerRadius = 20
        backButton.clipsToBounds = true
        backButton.layer.borderWidth = 1
        ///////
        
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil,
                self.firstNameTextField != nil,
                self.lastNameTextField != nil,
                self.studentIDTextField != nil   {
                print(error!)
            }   else    {
                //success
                print("Student Registration Successfull")

                self.ref.child("users").child("student").child((user?.uid)!).setValue(["firstName": self.firstNameTextField.text,
                                                                                      "lastName": self.lastNameTextField.text,
                                                                                      "studentID": self.studentIDTextField.text])
                
                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }
            
            
            
        }
        
        
        
        
    }
    
    
    func setUpTextFields(){      // sets up text fields to be able to interact with textFieldShouldReturn
        firstNameTextField.delegate = self
        firstNameTextField.tag = 0
        
        lastNameTextField.delegate = self
        lastNameTextField.tag = 1
        
        emailTextField.delegate = self
        emailTextField.tag = 2
        
        passwordTextField.delegate = self
        passwordTextField.tag = 3
        
        studentIDTextField.delegate = self
        studentIDTextField.tag = 4
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
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func logoPress(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
