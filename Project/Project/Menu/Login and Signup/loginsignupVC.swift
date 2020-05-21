//
//  loginsignupVC.swift
//  Project
//
//  Created by TTN on 21/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class loginsignupVC: UIViewController {
    
    @IBOutlet weak var login: UIView!
    @IBOutlet weak var signin: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        signin.isHidden = false
        login.isHidden = true
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
}



