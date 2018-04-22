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
    
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        updateProfileDataUI()
        
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
    
    func updateProfileDataUI(){
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child("students").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
//            let value = snapshot.value as? NSDictionary
//            let firstName = value?["firstName"] as? String ?? ""
//            let user = User(firstName : firstName)
            print(snapshot)
            //print(firstName)
            print("observing data")
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
            print("didn't work")
        }

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
