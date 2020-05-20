//
//  EmployeeTableViewCell.swift
//  Project
//
//  Created by TTN on 18/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var empAge: UILabel!
    @IBOutlet weak var empName: UILabel!
    @IBOutlet weak var empSalary: UILabel!
    @IBOutlet weak var empId: UILabel!
    @IBOutlet weak var empImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func dataValue(arr: TEmployee?)
    {
        self.empId.text = arr?.id
        self.empName.text = arr?.employee_name
        self.empSalary.text = arr?.employee_salary
        self.empAge.text = arr?.employee_age
    }
}
