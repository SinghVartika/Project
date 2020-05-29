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
    
    @IBAction func customTheme(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CustomViewController")
        self.navigationController!.pushViewController(vc, animated: true)
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
