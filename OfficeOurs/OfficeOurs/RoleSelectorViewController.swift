//
//  RoleSelectorViewController.swift
//  OfficeOurs
//
//  Created by Clayton Matulich on 4/21/18.
//  Copyright © 2018 Clayton Matulich. All rights reserved.
//

import UIKit

class RoleSelectorViewController: UIViewController {

    @IBOutlet weak var studentButton: UIButton!
    
    @IBOutlet weak var teacherButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentButton.layer.borderWidth = 1
        studentButton.layer.cornerRadius = 20
        studentButton.clipsToBounds = true
        
        
        teacherButton.layer.borderWidth = 1
        teacherButton.layer.cornerRadius = 20
        teacherButton.clipsToBounds = true
        
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
    
   
}
