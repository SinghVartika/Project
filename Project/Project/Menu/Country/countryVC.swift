//
//  countryVC.swift
//  Project
//
//  Created by TTN on 31/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class countryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let language = Locale.isoLanguageCodes.compactMap { Locale.current.localizedString(forLanguageCode: $0) }
    var countriesData = Locale.isoRegionCodes.compactMap { Locale.current.localizedString(forRegionCode: $0) }
    var countryCode = Locale.isoRegionCodes
//    var id : [String] = []
//    var countriesData : [String] = []
//
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }

    
    
     public static var cellMode: String = "None"

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let nib = UINib(nibName: "languagepickerTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "languagePicker")
        
        let nib2 = UINib(nibName: "countrypickerTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "countryPicker")
        
        
        
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        switch countryVC.cellMode {
            case "Country":
                return countriesData.count
            case "Language":
                return language.count
            default:
                return 0
            }
        }
    
        
        //MARK: Cell For Row
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if countryVC.cellMode == "Country" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "countryPicker", for: indexPath) as! countrypickerTableViewCell
                
                cell.setCountry(text: countriesData[indexPath.row])
                cell.setFlag(text: flag(country: countryCode[indexPath.row]))
 
                
                return cell
            }
            
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "languagePicker", for: indexPath) as! languagepickerTableViewCell
                
                cell.setLanguageListLabel(text: language[indexPath.row])
                
                return cell
            }
        }
        
        
        //MARK: Did Select Row
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at: indexPath, animated: true)
            
            if countryVC.cellMode == "Country" {
                
                AccountViewController.countryName = String(countriesData[indexPath.row].prefix(3).uppercased())
                AccountViewController.flagImage = flag(country: countryCode[indexPath.row])
            }
                
            else {
               
                AccountViewController.languageName = String(language[indexPath.row].prefix(3).uppercased())
            }
            
            self.navigationController?.popViewController(animated: true)
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 70
        }
        
    }


extension String {

    static func emojiFlag(for countryCode: String) -> String! {
        func isLowercaseASCIIScalar(_ scalar: Unicode.Scalar) -> Bool {
            return scalar.value >= 0x61 && scalar.value <= 0x7A
        }

        func regionalIndicatorSymbol(for scalar: Unicode.Scalar) -> Unicode.Scalar {
            precondition(isLowercaseASCIIScalar(scalar))

            // 0x1F1E6 marks the start of the Regional Indicator Symbol range and corresponds to 'A'
            // 0x61 marks the start of the lowercase ASCII alphabet: 'a'
            return Unicode.Scalar(scalar.value + (0x1F1E6 - 0x61))!
        }

        let lowercasedCode = countryCode.lowercased()
        guard lowercasedCode.count == 2 else { return nil }
        guard lowercasedCode.unicodeScalars.reduce(true, { accum, scalar in accum && isLowercaseASCIIScalar(scalar) }) else { return nil }

        let indicatorSymbols = lowercasedCode.unicodeScalars.map({ regionalIndicatorSymbol(for: $0) })
        return String(indicatorSymbols.map({ Character($0) }))
    }
}
