//
//  manualLogin.swift
//  Project
//
//  Created by TTN on 27/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import Foundation
import UIKit

var allUsers : [[String]] = []
var user : [String] = []
var currentUser : [String] = []

//MARK: Log in for the manual users
class manualLogin : login
{
    
    func loginUSer(Name: String?, Email: String?, Password: String, view: UIViewController) {
        
        let k = Name
        var temp : [String]?
        temp?.removeAll()
        
        if UserDefaults.standard.object(forKey: "users") != nil{
        allUsers = UserDefaults.standard.object(forKey: "users") as! [[String]]
        }
        
        if UserDefaults.standard.object(forKey: "currentUser") != nil{
        currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
        }
        
        //Check if no user exists
        if (allUsers.count == 0)
        {
            let alertController = UIAlertController(title: "No user exists", message: "No one is logged in. First sign in to access the login functionality.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
        }
        
        if(allUsers.count != 0)
        {
        for i in 0...allUsers.count-1
        {
            if k == allUsers[i][0]
            {
                temp = allUsers[i]
            }
        }
        }
        
        
        //Check for the empty labels
        
        if Name!.isEmpty || Password.isEmpty
        {
            let alertController = UIAlertController(title: "Empty Values", message: "Please enter all the informations. All the informations are compulsory ", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
        }
        
        
        user.append(Name ?? "")
        user.append(Password)

        
        //If the user is already logged in with an account then they need to logout to use another one
        if currentUser.isEmpty == false {
            
            let alertController = UIAlertController(title: "Already Logged in", message: "Kindly Log-out to use a different login account", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
        }
        
            // If account does not exists
        else if temp == nil{
            let alertController = UIAlertController(title: "User does not exist", message: "Kindly sign-in with an account first to use the login", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
        }
            
            // If the password entered is wrong
        else if temp![1] != Password{
            let alertController = UIAlertController(title: "Password Incorrect", message: "Pleae login using the correct password. If you have forgotten your password then use the forgot password option.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
        }
            
            //Complete the login process
        else{
            
            currentUser = user
            
            UserDefaults.standard.set(currentUser, forKey: "currentUser")
            UserDefaults.standard.set(allUsers, forKey: "users")
            temp?.removeAll()
            user.removeAll()
            currentUser.removeAll()
            view.navigationController?.popViewController(animated: true)
            
        }
        temp?.removeAll()
        user.removeAll()
        currentUser.removeAll()
    }
    
    //MARK: Log out for the manual users
    func logoutUser(view: UIViewController) {
        
        if UserDefaults.standard.object(forKey: "users") != nil{
        allUsers = UserDefaults.standard.object(forKey: "users") as! [[String]]
        }
        
        if UserDefaults.standard.object(forKey: "currentUser") != nil{
        currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
        }
        
        //If no one is currently logged in
        if currentUser.isEmpty == true {
            
            let alertController = UIAlertController(title: "No one Logged in", message: "Kindly Login first to logout from it", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
        }
        
        // Complete the log out process
        else{
            currentUser.removeAll()
            //allUsers.removeAll()
            
            print (allUsers)
            print (currentUser)
            UserDefaults.standard.set(currentUser, forKey: "currentUser")
            UserDefaults.standard.set(allUsers, forKey: "users")
            
        }
        
    }
    
    //MARK: Sign up for the manual users
    func signupUser(Name: String?, Email: String?, Password: String, rePassword: String, ques: String?, view: UIViewController) {
        
        if UserDefaults.standard.object(forKey: "users") != nil{
        allUsers = UserDefaults.standard.object(forKey: "users") as! [[String]]
        }
        
        if UserDefaults.standard.object(forKey: "currentUser") != nil{
        currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
        }
        user.append(Name ?? "")
        user.append(Password)
        user.append(ques ?? "")
        
        var temp : [String]?
        if(allUsers.count != 0)
        {
        for i in 0...allUsers.count-1
        {
            if Name == allUsers[i][0]
            {
                temp = allUsers[i]
            }
        }
        }
        //User already exists
        if temp != nil
        {
            let alertController = UIAlertController(title: "User already exist", message: "The user name you have entered already exists.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
        }
        
        //Check for the empty labels
        
         if Name == "" || Password == "" || rePassword == "" || ques == ""
        {
            let alertController = UIAlertController(title: "Empty Values", message: "Please enter all the informations. All the informations are compulsory ", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
            
        }
        
            //Check for password and re-typed password
        else if Password != rePassword {
            let alertController = UIAlertController(title: "Password Do not match", message: "Please re-type the password correctly", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
            
        }
            
        //If the user is already logged in with an account then they need to logout to use another one
            
        else if  currentUser.isEmpty == false {
            
            let alertController = UIAlertController(title: "Already Signed in", message: "Kindly Log-out to use a different login account", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
            
        }
            
            //If no error occurs then complete the Sign up process
            
        else{
            currentUser.removeAll()
            
            currentUser = user
            allUsers.append(user)
            user.removeAll()
            temp?.removeAll()
            
            UserDefaults.standard.set(currentUser, forKey: "currentUser")
            UserDefaults.standard.set(allUsers, forKey: "users")
            view.navigationController?.popViewController(animated: true)
            currentUser.removeAll()
        }
        user.removeAll()
        temp?.removeAll()
        
    }
    
    //MARK: Function for the forget password action
    
    func forgetPassword(Name: String?, Password: String, rePassword: String, ques: String?, view: UIViewController)
    {
        if UserDefaults.standard.object(forKey: "users") != nil{
        allUsers = UserDefaults.standard.object(forKey: "users") as! [[String]]
        }
        
        if UserDefaults.standard.object(forKey: "currentUser") != nil{
        currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
        }
        
        var temp : [String]?
        for i in 0...allUsers.count-1
        {
            if Name == allUsers[i][0]
            {
                temp = allUsers[i]
            }
        }
        
        //Currently a user is logged in
        if  currentUser.isEmpty == false {
            
            let alertController = UIAlertController(title: "Already Signed in", message: "Have You forgotten your password? Kindly logout and login again to change your password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
            
        }
        
        //User name entered is wrong
        else if temp == nil
        {
            let alertController = UIAlertController(title: "No Such User exists", message: "The user name you have entered does not exists.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
        }
        
        //Check for password and re-typed password
        else if Password != rePassword {
            let alertController = UIAlertController(title: "Password Do not match", message: "Please re-type the password correctly", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
            
        }
            
        //Answer to the security question is wrong
        else if temp![2] != ques {
            let alertController = UIAlertController(title: "Wrong Answer", message: "Answer to the security question is wrong. Please try again.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            view.present(alertController, animated: true, completion: nil)
            
        }
        
        //Change the password
        else
        {
            for j in 0...allUsers.count-1
            {
                if Name == allUsers[j][0]
                {
                    allUsers[j].removeAll()
                    allUsers[j] += [Name! , Password , ques!]
                    
                }
            }
            UserDefaults.standard.set(currentUser, forKey: "currentUser")
            UserDefaults.standard.set(allUsers, forKey: "users")
            temp?.removeAll()
            currentUser.removeAll()
            allUsers.removeAll()
            view.navigationController?.popViewController(animated: true)
            
        }
        currentUser.removeAll()
        allUsers.removeAll()
    }
    

}

