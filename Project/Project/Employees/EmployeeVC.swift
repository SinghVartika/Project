//
//  ViewController.swift
//  Project
//
//  Created by TTN on 20/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
class EmployeeVC: UIViewController {
    
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var cardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isHidden = false
        cardView.isHidden = true
        
    }
    
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            tableView.isHidden = false
            cardView.isHidden = true
        }
        else {
            tableView.isHidden = true
            cardView.isHidden = false
        }
    }
   
   


}
