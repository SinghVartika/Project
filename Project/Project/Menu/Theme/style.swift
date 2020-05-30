//
//  style.swift
//  Project
//
//  Created by TTN on 16/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//
import Foundation
import UIKit

struct Theme {

    static var backgroundColor:UIColor?
    static var buttonTextColor:UIColor?
    static var buttonBackgroundColor:UIColor?
    static var buttonBackgroundColorHighlighted:UIColor?
    static var labletextColor:UIColor?
    static var font : String?

    static public func defaultTheme() {
        self.backgroundColor = UIColor.white
        self.buttonTextColor = UIColor.blue
        self.buttonBackgroundColor = UIColor.white
        self.buttonBackgroundColorHighlighted = UIColor.red
        self.labletextColor = UIColor.black
        self.font = "Times New Roman"
        updateDisplay()
    }

    static public func darkTheme() {
        self.backgroundColor = UIColor.black
        self.buttonTextColor = UIColor.white
        self.buttonBackgroundColor = UIColor.black
        self.buttonBackgroundColorHighlighted = UIColor.yellow
        self.labletextColor = UIColor.white
        self.font = "Helvetica"
        updateDisplay()
    }
    
    static public func customTheme(_ Text : UIColor , _ Background : UIColor , _ Button : UIColor) {
        self.backgroundColor = Background
        self.buttonTextColor = Text
        self.buttonBackgroundColor = Button
        self.buttonBackgroundColorHighlighted = Button
        self.labletextColor = Text
        self.font = "Helvetica"
        updateDisplay()
    }

    static public func updateDisplay() {
        let proxyButton = UIButton.appearance()
        proxyButton.setTitleColor(Theme.buttonTextColor, for: .normal)
        proxyButton.titleLabel?.font = UIFont(name: self.font ?? "", size: 18)
        proxyButton.titleLabel?.backgroundColor = Theme.buttonBackgroundColor
        if (proxyButton.isHighlighted == true)
        {
            proxyButton.backgroundColor = Theme.buttonBackgroundColorHighlighted
        }
        else
        {
            proxyButton.backgroundColor = Theme.buttonBackgroundColor
        }
        
        
        let proxyLable = UILabel.appearance()
        proxyLable.textColor = Theme.labletextColor
        proxyLable.font = UIFont(name: self.font ?? "", size: 18)

        let proxyView = UIView.appearance()
        proxyView.backgroundColor = backgroundColor
        
        let proxynav = UINavigationBar.appearance()
        proxynav.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
    }
}
