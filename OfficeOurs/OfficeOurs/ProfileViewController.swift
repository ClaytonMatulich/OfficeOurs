//
//  ProfileViewController.swift
//  OfficeOurs
//
//  Created by Clayton Matulich on 4/21/18.
//  Copyright © 2018 Clayton Matulich. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

   
    
    @IBOutlet weak var manageButton: UIButton!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var userProfile: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.userProfile.layer.cornerRadius = self.userProfile.frame.size.width / 2;
        self.userProfile.clipsToBounds = true
        self.userProfile.layer.borderWidth = 1
        self.userProfile.layer.borderColor = UIColor.white.cgColor
        
        manageButton.layer.cornerRadius = 20
        manageButton.clipsToBounds = true
        
        scheduleButton.layer.cornerRadius = 20
        scheduleButton.clipsToBounds = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        do {
            try Auth.auth().signOut()
            
        } catch {
            print("Error with logout")
        }

    }
    

}
