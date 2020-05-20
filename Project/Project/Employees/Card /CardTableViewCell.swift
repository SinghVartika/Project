//
//  CardTableViewCell.swift
//  Project
//
//  Created by TTN on 20/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

        @IBOutlet weak var employeeID: UILabel!
        @IBOutlet weak var employeeName: UILabel!
        @IBOutlet weak var employeeSalary: UILabel!
        @IBOutlet weak var employeeAge: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            
        }
        
        

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        func dataCell(arr: Employee?) {
               employeeID.text = "ID: \(arr?.id ?? "")"
               employeeName.text = "Name: \(arr?.employee_name ?? "")"
               employeeSalary.text = "Salary: Rs.\(arr?.employee_salary ?? "")"
               employeeAge.text = "Age: \(arr?.employee_age ?? "")"
           }
    }
        

