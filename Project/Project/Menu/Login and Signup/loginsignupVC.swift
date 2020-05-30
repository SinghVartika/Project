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
import FBSDKLoginKit

protocol login {
    func loginUSer(Name: String?, Email: String?, Password: String, view: UIViewController)
    func logoutUser(view: UIViewController)
    func signupUser(Name: String?, Email: String?, Password: String, rePassword: String, ques:String?, view: UIViewController)
}

class loginsignupVC: UIViewController , LoginButtonDelegate, GIDSignInDelegate{
    
    @IBOutlet weak var login: UIView!
    @IBOutlet weak var signin: UIView!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var loginButton: FBLoginButton!
    @IBOutlet weak var user: UILabel!
    var currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
    
    var loginned = manualLogin()
    override func viewDidLoad() {
        super.viewDidLoad()
        signin.isHidden = false
        login.isHidden = true
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
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
    
    //Logout Button funtion
    @IBAction func logOutAction(_ sender: Any) {
        
        if currentUser.isEmpty != true
        {
            loginned.logoutUser(view: self)
        }
        else if Auth.auth().currentUser != nil
        {
            GIDSignIn.sharedInstance().signOut()
            do {
                //Try signing out
                try Auth.auth().signOut()
            }
            catch let signOutError as NSError {
                //Catch error if any while signin out
                print ("Error signing out: %@", signOutError)
            }
        }
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AccountViewController")
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
    //Google signin button
    @IBAction func googleSignIn(sender: GIDSignInButton) {
        
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
        print("Google Sing In")
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
        // When user is signed in
        if Auth.auth().currentUser != nil {
            let myAlert = UIAlertController(title:"Alert", message:"Already SignIn", preferredStyle: UIAlertController.Style.alert);
            let okAction = UIAlertAction(title:"Ok", style:UIAlertAction.Style.default, handler:nil);
            myAlert.addAction(okAction);
            self.present(myAlert, animated:true, completion:nil);
        }
        else {
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    return
                }
                if error != nil {
                    return
                }
                else {
                    let myAlert = UIAlertController(title:"Alert", message:"User successfully SignIn", preferredStyle: UIAlertController.Style.alert);
                    let okAction = UIAlertAction(title:"Ok", style:UIAlertAction.Style.default, handler:nil);
                    myAlert.addAction(okAction);
                    self.present(myAlert, animated:true, completion:nil);
                    self.currentuser()
                }
                
            })
        }
    }
    func currentuser() {
        if let currentUser = Auth.auth().currentUser {
            UserDefaults.standard.set(true, forKey: "LoggedIn")
            UserDefaults.standard.synchronize()
            user.text = " You are login as - " + (currentUser.displayName ?? "Display name not found")
        }
    }
    
    //Facebook sign in
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        else {
            if Auth.auth().currentUser != nil {
                let myAlert = UIAlertController(title:"Alert", message:"Already SignIn", preferredStyle: UIAlertController.Style.alert);
                
                let okAction = UIAlertAction(title:"Ok", style:UIAlertAction.Style.default, handler:nil);
                
                myAlert.addAction(okAction);
                self.present(myAlert, animated:true, completion:nil);
            }
            else {
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current?.tokenString ?? "")
                Auth.auth().signIn(with: credential, completion: { (user, error) in
                    if let error = error {
                        print("Login error: \(error.localizedDescription)")
                        return
                    }
                    if error != nil {
                        return
                    }
                    else {
                        let myAlert = UIAlertController(title:"Alert", message:"User successfully SignIn", preferredStyle: UIAlertController.Style.alert);
                        
                        let okAction = UIAlertAction(title:"Ok", style:UIAlertAction.Style.default, handler:nil);
                        
                        myAlert.addAction(okAction);
                        self.present(myAlert, animated:true, completion:nil);
                        self.currentuser()
                    }
                })
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("UserLoggedOut")
        LoginManager().logOut()
        try! Auth.auth().signOut()
        user.alpha = 0
    }
}
