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
    @IBOutlet weak var captcha : UILabel!
    @IBOutlet weak var captchaAnswer : UITextField!
    
    var login = manualLogin()
    var currentUser : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        captcha.text = randomString(length: 4)
        if UserDefaults.standard.object(forKey: "currentUser") != nil{
        currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
        }
        // Do any additional setup after loading the view.
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        if ((GIDSignIn.sharedInstance()?.currentUser) != nil)
        {
            let alertController = UIAlertController(title: "Already Logged in Using Google", message: "Kindly Log-out to use a different login account", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        else if ( captcha.text != captchaAnswer.text)
        {
            let alertController = UIAlertController(title: "Incorrect Answer for Captcha", message: "Kindly fill the text correctly.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
            self.captcha.text = randomString(length: 4)
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
