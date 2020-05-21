//
//  loginsignupVC.swift
//  Project
//
//  Created by TTN on 21/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Firebase

class loginsignupVC: UIViewController {
    
    @IBOutlet weak var login: UIView!
    @IBOutlet weak var signin: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        signin.isHidden = false
        login.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            signin.isHidden = false
            login.isHidden = true
        }
        else {
            signin.isHidden = true
            login.isHidden = false
        }
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        
        
        //No user exist but trying to sign out
        if Auth.auth().currentUser == nil {
            
            let alertController = UIAlertController(title: "Sign In first", message: "No user exist kindly sign in first", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        do {
            //Try signing out
            try Auth.auth().signOut()
            //            let alertController = UIAlertController(title: "Logged Out", message: "Successfully Logged Out", preferredStyle: .alert)
            //            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            //            alertController.addAction(defaultAction)
            //            self.present(alertController, animated: true, completion: nil)
        }
        catch let signOutError as NSError {
            //Catch error if any while signin out
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AccountViewController")
        self.navigationController!.pushViewController(vc, animated: true)
    }
}



