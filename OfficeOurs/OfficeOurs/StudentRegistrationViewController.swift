//
//  StudentRegistrationViewController.swift
//  OfficeOurs
//
//  Created by Clayton Matulich on 4/21/18.
//  Copyright © 2018 Clayton Matulich. All rights reserved.
//

import UIKit
import Firebase

class StudentRegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 10
        submitButton.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                print(error!)
            }else{
                //success
                print("Student Registration Successfull")
                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
