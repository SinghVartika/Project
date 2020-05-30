//
//  BackgroundSelectorViewController.swift
//  Project
//
//  Created by TTN on 28/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//


import UIKit
import SwiftHSVColorPicker


class BackgroundSelectorViewController: UIViewController {
    @IBOutlet weak var myview : UIView!
    let colorPicker = SwiftHSVColorPicker(frame: CGRect(x: 10, y: 20, width: 300, height: 400))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myview.addSubview(colorPicker)
        colorPicker.setViewColor(UIColor.red)
        
    }
    

    @IBAction func confirm(_ sender: Any) {
        CustomViewController.bknColor = colorPicker.color
        self.navigationController?.popViewController(animated: true)
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
