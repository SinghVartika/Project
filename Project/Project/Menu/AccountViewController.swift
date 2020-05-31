//
//  AccountViewController.swift
//  Project
//
//  Created by TTN on 20/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class AccountViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var tbview: UITableView!
    @IBOutlet weak var sbtn: UIButton!
    @IBOutlet weak var jbtn: UIButton!
    @IBOutlet weak var contentStackView: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    
    public static var languageName: String = "ENGLISH"
    public static var countryName: String = "IND"
    public static var flagImage: String = "🇮🇳"
    
    let arr = [ ["Location", "Movies", "Notifications", "My Circle/Employee"], ["Country", "Language", "About Us", "FAQ", "Change Theme"] ]
    
    let imgarr = [ [#imageLiteral(resourceName: "TrackOrder"), #imageLiteral(resourceName: "SizeChart"), #imageLiteral(resourceName: "Notifications"), #imageLiteral(resourceName: "StoreLocator")], [ #imageLiteral(resourceName: "Country"), #imageLiteral(resourceName: "Language"), #imageLiteral(resourceName: "AboutUs"), #imageLiteral(resourceName: "FAQ"), #imageLiteral(resourceName: "ShippingAndReturn")] ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageOutlet.layer.cornerRadius = imageOutlet.frame.height/2
        imageOutlet.contentMode = .scaleToFill
        imageOutlet.clipsToBounds = true
        
        let nib = UINib(nibName: "AccountTableViewCell", bundle: nil)
        tbview.register(nib, forCellReuseIdentifier: "AccountTableCell")
        
        let nib2 = UINib(nibName: "CountryTableViewCell", bundle: nil)
        tbview.register(nib2, forCellReuseIdentifier: "CountryTableCell")
        
        let nib3 = UINib(nibName: "LanguageTableViewCell", bundle: nil)
        tbview.register(nib3, forCellReuseIdentifier: "LanguageTableCell")
        
        //MARK: Displaying the name of the current user
        
    
            
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tbview.reloadData()
        
        if UserDefaults.standard.object(forKey: "currentUser") != nil{
            currentUser = UserDefaults.standard.object(forKey: "currentUser") as! [String]
        }
        
        if Auth.auth().currentUser != nil
        {
            let user:String = String(describing: Auth.auth().currentUser!.displayName!)
            welcomeLabel.text = "Welcome \(user)"
        }
        else if (currentUser.isEmpty == false)
        {
            let user:String = String(describing: currentUser[0])
            welcomeLabel.text = "Welcome \(user)"
        }
        else if (GIDSignIn.sharedInstance()?.currentUser) != nil
        {
            let user = Auth.auth().currentUser
            welcomeLabel.text = "Welcome \(String(describing: user?.displayName))"
        }
        else
        {
            welcomeLabel.text = "Welcome"
        }
    }
    
    @IBAction func addImageBtn(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func camera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func photoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            myPickerController.allowsEditing = true
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        {
            let pickedImage = info[.editedImage]
            self.imageOutlet.image = pickedImage as? UIImage
        }
    }
    
    
    @IBAction func signin(_ sender : UIButton){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginsignupVC")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func join(_ sender : UIButton){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginsignupVC")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 1 && indexPath.row == 0 {
            
            let cell = tbview.dequeueReusableCell(withIdentifier: "CountryTableCell", for: indexPath) as! CountryTableViewCell
            
            cell.setCountryIconImageView(image: imgarr[1][0])
            cell.setCountryTitleLabel(text: arr[1][0])
            cell.setCountryFlagImageView(image: AccountViewController.flagImage)
            cell.setCountryNameLabel(text: AccountViewController.countryName)
            
            return cell
            
        }
            
        else if indexPath.section == 1 && indexPath.row == 1 {
            
            let cell = tbview.dequeueReusableCell(withIdentifier: "LanguageTableCell", for: indexPath) as! LanguageTableViewCell
            
            cell.setLaguageIconImageView(image: imgarr[1][1])
            cell.setLanguageTitleLabel(text: arr[1][1])
            cell.setLanguageNameLabel(text: String(AccountViewController.languageName.prefix(3)))
            
            return cell
            
        }
            
        else {
            
            let cell = tbview.dequeueReusableCell(withIdentifier: "AccountTableCell", for: indexPath) as! AccountTableViewCell
            
            cell.setValueToLabel(text: arr[indexPath.section][indexPath.row])
            cell.setImage(image: imgarr[indexPath.section][indexPath.row])
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //return empty string to the sectionHeader
        return " "
    }
    
    //MARK: Did Select Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tbview.deselectRow(at: indexPath, animated: true)
        
        
        
        if indexPath.section == 1 && indexPath.row == 0 {
            
            
            countryVC.cellMode = "Country"
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "countryVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
            
        else if indexPath.section == 1 && indexPath.row == 1 {
            
            
            countryVC.cellMode = "Language"
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "countryVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
            
        else if indexPath.section == 0 && indexPath.row == 0 {
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "locationVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
            
        else if indexPath.section == 0 && indexPath.row == 1 {
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
            
        else if indexPath.section == 0 && indexPath.row == 3 {
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "EmployeeVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
            
        else if indexPath.section == 1 && indexPath.row == 4 {
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "themeVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
}
