//
//  CustomViewController.swift
//  
//
//  Created by TTN on 27/05/20.
//

import UIKit
import iOSDropDown

class CustomViewController: UIViewController {
    
    @IBOutlet weak var fontList : DropDown!
    static var txtColor : UIColor?
    static var bknColor : UIColor?
    static var btnColor : UIColor?
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
    
    //Selecting the text color
    @IBAction func txtColor(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TextSelectorViewController")
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
    //Selecting the backgound color
    @IBAction func bkColor(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BackgroundSelectorViewController")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    //Selecting the Button color
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
    
    //Applying the selected theme
    @IBAction func ApplySelection(_ sender: Any) {
        
        let sample = UILabel.appearance()
        sample.font = UIFont(name: self.font ?? "Times New Roman", size: 14)
        
        Theme.customTheme(CustomViewController.txtColor!, CustomViewController.bknColor!, CustomViewController.btnColor!)
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
