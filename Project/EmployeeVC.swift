//
//  EmployeeVC.swift
//  
//
//  Created by TTN on 20/05/20.
//

import UIKit

class EmployeeVC: UIViewController {

    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var tableView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        cardView.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectedControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            tableView.isHidden = true
            cardView.isHidden = false
        }
        else {
            tableView.isHidden = false
            cardView.isHidden = true
        }
    }
}
