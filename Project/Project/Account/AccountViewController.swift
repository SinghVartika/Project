//
//  AccountViewController.swift
//  Project
//
//  Created by TTN on 20/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var tbview: UITableView!
    @IBOutlet weak var sbtn: UIButton!
    @IBOutlet weak var jbtn: UIButton!
    @IBOutlet weak var contentStackView: UIView!
    
    public static var languageName: String = "ENGLISH"
    public static var countryName: String = "IND"
    public static var flagImage: UIImage = #imageLiteral(resourceName: "Country")
    
    let arr = [ ["Track Order", "Size Chart", "Notifications", "Store Location"], ["Country", "Language", "About Us", "FAQ", "Shipping & Returns"] ]
    
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
     let vc = storyboard.instantiateViewController(withIdentifier: "signInViewController")
    self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func join(_ sender : UIButton){
       let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
     let vc = storyboard.instantiateViewController(withIdentifier: "joinViewController")
    self.navigationController!.pushViewController(vc, animated: true)
    }
}
extension AccountViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return arr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 1 && indexPath.row == 0 {
            
            let cell = tbview.dequeueReusableCell(withIdentifier: "CountryTableCell", for: indexPath) as! CountryTableViewCell
            
            cell.setCountryIconImageView(image: AccountViewController.flagImage)
            cell.setCountryTitleLabel(text: AccountViewController.countryName)
            cell.setCountryFlagImageView(image: AccountViewController.flagImage)
            cell.setCountryNameLabel(text: AccountViewController.countryName)
            
            return cell
            
        }
            
        else if indexPath.section == 1 && indexPath.row == 1 {
           
            let cell = tbview.dequeueReusableCell(withIdentifier: "languagePicker", for: indexPath) as! LanguageTableViewCell
            
            cell.setLaguageIconImageView(image: imgarr[1][1])
            cell.setLanguageTitleLabel(text: arr[1][1])
            cell.setLanguageNameLabel(text: String(AccountViewController.languageName.prefix(3)))
            
            return cell
            
        }
      
        else {
            
            let cell = tbview.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as! AccountTableViewCell
        
            cell.setValueToLabel(text: arr[indexPath.section][indexPath.row])
            cell.setImage(image: imgarr[indexPath.section][indexPath.row])
        
            return cell
        }
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
            
            print("India")
            countryVC.cellMode = "Country"
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CountryAndLanguageViewController")
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
            
        else if indexPath.section == 1 && indexPath.row == 1 {
            
            print("English")
            countryVC.cellMode = "Language"
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CountryAndLanguageViewController")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
}
}
