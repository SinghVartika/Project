//
//  CustomViewController.swift
//  
//
//  Created by TTN on 27/05/20.
//

import UIKit
import iOSDropDown

class CustomViewController: UIViewController, TextColorSelecterDelegate, TitleTextColorSelecterDelegate, BackgroundColorSelecterDelegate, ButtonColorSelecterDelegate {
    
    @IBOutlet weak var fontList : DropDown!
    var txtColor : UIColor?
    var bknColor : UIColor?
    var btnColor : UIColor?
    var ttlTxtColor : UIColor?
    var font : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        fontList.optionArray = UIFont.familyNames
        fontList.didSelect { (SelectedFont, Index, id) in
            self.font = SelectedFont
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func txtColor(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TextSelectorViewController")
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func bkColor(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BackgroundSelectorViewController")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnColor(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ButtonSelectorViewController")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func titleTxtColor(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TitleTextSelectorViewController")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    // Delegate for setting the text color
    func userDidSelectTextColor(info1: UIColor) {
        txtColor = info1
    }
    
    // Delegate for setting the title text color
    func userDidSelectTitleTextColor(info4: UIColor) {
        ttlTxtColor = info4
    }
    
    // Delegate for setting the text color
    func userDidSelectBackgroundColor(info2: UIColor) {
        bknColor = info2
        print(bknColor!)
    }
    
    // Delegate for setting the text color
    func userDidSelectButtonColor(info3: UIColor) {
        btnColor = info3
    }
    
    @IBAction func ApplySelection(_ sender: Any) {
        
        let sample = UILabel.appearance()
        sample.font = UIFont(name: self.font ?? "Times New Roman", size: 14)
        
        Theme.customTheme(txtColor!, bknColor!, btnColor!)
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
