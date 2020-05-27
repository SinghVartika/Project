//
//  LoginViewController.swift
//  Project
//
//  Created by TTN on 21/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var password : UITextField!
    //@IBOutlet weak var signInButton: GIDSignInButton!

    
    var login = manualLogin()
    override func viewDidLoad() {
        super.viewDidLoad()
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().signIn()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        login.loginUSer(Email: email.text ?? "", Password: password.text ?? "", view: self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
