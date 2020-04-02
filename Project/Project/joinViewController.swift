//
//  joinViewController.swift
//  Project
//
//  Created by TTN on 31/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class joinViewController: UIViewController {

    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageOutlet.layer.cornerRadius = imageOutlet.frame.height/2
        imageOutlet.contentMode = .scaleToFill
        imageOutlet.clipsToBounds = true

        // Do any additional setup after loading the view.
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
                myPickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate;
                myPickerController.sourceType = .camera
                self.present(myPickerController, animated: true, completion: nil)
            }
        }
        
        func photoLibrary() {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let myPickerController = UIImagePickerController()
                myPickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate;
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
