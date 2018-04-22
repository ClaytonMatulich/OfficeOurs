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
    
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      submitButton.layer.borderWidth = 1
        submitButton.layer.cornerRadius = 20
        submitButton.clipsToBounds = true
        
        backButton.layer.borderWidth = 1
        backButton.layer.cornerRadius = 20
        backButton.clipsToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoPressed(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
}
