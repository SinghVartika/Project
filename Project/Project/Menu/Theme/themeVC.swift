//
//  themeVC.swift
//  Project
//
//  Created by TTN on 16/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class themeVC: UIViewController {
 
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkButton(_ sender: UIButton) {
        defaults.set("Dark", forKey: "theme")
        Theme.darkTheme()
        self.loadView()
    }

    @IBAction func lightButton(_ sender: UIButton) {
        defaults.set("Light", forKey: "theme")
        Theme.defaultTheme()
        self.loadView()
    }
    
    @IBAction func defaultButton(_ sender: Any) {
        defaults.set("None", forKey: "theme")
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
