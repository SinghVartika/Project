//
//  ForgetPasswordViewController.swift
//  Project
//
//  Created by TTN on 29/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import GoogleSignIn

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var rePassword: UITextField!
    @IBOutlet weak var nwPassword: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var petName: UITextField!
    var login = manualLogin()
    var currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        if ((GIDSignIn.sharedInstance()?.currentUser) != nil)
        {
            let alertController = UIAlertController(title: "Already Logged in Using Google", message: "Kindly Log-out to use a different login account", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        login.forgetPassword(Name: userName.text, Password: nwPassword.text ?? "", rePassword: rePassword.text ?? "", ques: petName.text, view: self)
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
