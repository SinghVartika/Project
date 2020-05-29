//
//  loginsignupVC.swift
//  Project
//
//  Created by TTN on 21/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

protocol login {
    func loginUSer(Name: String?, Email: String?, Password: String, view: UIViewController)
    func logoutUser(view: UIViewController)
    func signupUser(Name: String?, Email: String?, Password: String, rePassword: String, ques:String?, view: UIViewController)
}

class loginsignupVC: UIViewController {
    
    @IBOutlet weak var login: UIView!
    @IBOutlet weak var signin: UIView!
    @IBOutlet weak var signInButton: GIDSignInButton!
    var currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
    
    var loginned = manualLogin()
    override func viewDidLoad() {
        super.viewDidLoad()
        signin.isHidden = false
        login.isHidden = true
        GIDSignIn.sharedInstance()?.presentingViewController = self
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
        
        if currentUser.isEmpty == false
        {
            loginned.logoutUser(view: self)
        }
        else
        {
            GIDSignIn.sharedInstance().signOut()
            do {
                try Auth.auth().signOut()
                } catch let signOutError as NSError {
                  print ("Error signing out: %@", signOutError)
                }
        }
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AccountViewController")
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func googleSignIn(sender: AnyObject) {
        
        if currentUser.isEmpty != true
        {
            let alertController = UIAlertController(title: "Already Logged in", message: "Kindly Log-out to use a different login account", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        GIDSignIn.sharedInstance().signIn()
      }
      func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Google Sing In didSignInForUser")
        if let error = error {
          print(error.localizedDescription)
          return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
    // When user is signed in
        Auth.auth().signIn(with: credential, completion: { (user, error) in
          if let error = error {
            print("Login error: \(error.localizedDescription)")
            return
          }
        })
      }
      // Start Google OAuth2 Authentication
      func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {
      
        // Showing OAuth2 authentication window
        if let aController = viewController {
          present(aController, animated: true) {() -> Void in }
        }
      }
      // After Google OAuth2 authentication
      func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
        // Close OAuth2 authentication window
        dismiss(animated: true) {() -> Void in }
      }
    
}



