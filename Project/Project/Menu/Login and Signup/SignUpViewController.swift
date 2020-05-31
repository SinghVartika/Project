//
//  SignUpViewController.swift
//  Project
//
//  Created by TTN on 21/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignUpViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBOutlet weak var securityQuestion: UITextField!

    var currentUser : [String] = []
    var login = manualLogin()
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "currentUser") != nil{
        currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if ((GIDSignIn.sharedInstance()?.currentUser) != nil)
        {
            let alertController = UIAlertController(title: "Already Logged in Using Google", message: "Kindly Log-out to use a different login account", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        login.signupUser(Name: name.text ?? "", Email: "none", Password: password.text ?? "", rePassword: passwordConfirm.text ?? "", ques: securityQuestion.text ?? "" , view: self)
        
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
