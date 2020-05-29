//
//  TitleTextSelectorViewController.swift
//  Project
//
//  Created by TTN on 28/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import SwiftHSVColorPicker


protocol TitleTextColorSelecterDelegate: class {
    func userDidSelectTitleTextColor(info4: UIColor)
}

class TitleTextSelectorViewController: UIViewController {
    @IBOutlet weak var myview : UIView!
    
    let colorPicker = SwiftHSVColorPicker(frame: CGRect(x: 10, y: 20, width: 300, height: 400))
    
    weak var delegate: TitleTextColorSelecterDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myview.addSubview(colorPicker)
        colorPicker.setViewColor(UIColor.red)
        
        self.dismiss(animated: true, completion: nil)

    }
    @IBAction func confirm(_ sender: Any) {
        delegate?.userDidSelectTitleTextColor(info4: colorPicker.color)
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
