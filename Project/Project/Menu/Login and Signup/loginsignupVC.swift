//
//  loginsignupVC.swift
//  Project
//
//  Created by TTN on 21/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Firebase

protocol login {
    func loginUSer(Email: String, Password: String, view: UIViewController)
    func logoutUser(view: UIViewController)
    func signupUser(Email: String, Password: String, rePassword: String, view: UIViewController)
}

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
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AccountViewController")
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
}



