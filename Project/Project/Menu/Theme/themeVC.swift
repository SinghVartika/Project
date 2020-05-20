//
//  themeVC.swift
//  Project
//
//  Created by TTN on 16/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class themeVC: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkButton(_ sender: UIButton) {
        AppDelegate.thm = "Dark"
        Theme.darkTheme()
        self.loadView()
    }

    @IBAction func lightButton(_ sender: UIButton) {
        AppDelegate.thm = "Light"
        Theme.defaultTheme()
        self.loadView()
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
