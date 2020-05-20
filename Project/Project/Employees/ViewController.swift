//
//  ViewController.swift
//  Project
//
//  Created by TTN on 20/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var card : UIView!
    var image : UIImageView!
    var emp_sal: UILabel!
    var emp_name: UILabel!
    var emp_age: UILabel!
    var emp_id: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        card = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100, height: 200))
        card.backgroundColor = UIColor.lightGray
        view.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: card as Any, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 20.0).isActive = true
        NSLayoutConstraint(item: card as Any, attribute: .top, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 20.0).isActive = true
        NSLayoutConstraint(item: card as Any, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 20.0).isActive = true

        //card.addConstraint()
        // Do any additional setup after loading the view.
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
