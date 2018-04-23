//
//  TeacherRegistrationViewController.swift
//  OfficeOurs
//
//  Created by Clayton Matulich on 4/21/18.
//  Copyright © 2018 Clayton Matulich. All rights reserved.
//

import UIKit
import Firebase

class TeacherRegistrationViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var teacherIDTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        submitButton.layer.borderWidth = 1
        submitButton.layer.cornerRadius = 20
        submitButton.clipsToBounds = true
        
        backButton.layer.borderWidth = 1
        backButton.layer.cornerRadius = 20
        backButton.clipsToBounds = true
        
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
                self.schoolNameTextField != nil,
                self.teacherIDTextField != nil   {
                    print(error!)
            } else {
                //success
                print("Student Registration Successfull")
                
                self.ref.child("users").child("teacher").child((user?.uid)!).setValue(["firstName": self.firstNameTextField.text,
                                                                                       "lastName": self.lastNameTextField.text,
                                                                                       "schoolName": self.schoolNameTextField.text,
                                                                                       "teacherID": self.teacherIDTextField.text])
                
                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoPressed(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
}
