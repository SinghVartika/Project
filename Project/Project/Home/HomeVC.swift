//
//  Home.swift
//  Project
//
//  Created by TTN on 20/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class HomeVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var movSection: UITableView!
    static var sect : Int?
    var sections = [ "" , "Action","Drama","Science Fiction","Kids","Horror"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movSection.dataSource = self
        movSection.delegate = self
        
        let nib1 = UINib.init(nibName: "MovieTableViewCell", bundle: nil)
        movSection.register(nib1, forCellReuseIdentifier: "MovieCell")
        
    }
    
    //MARK: Table view for the other sections
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        if(indexPath.section == 0)
         {
            HomeVC.sect = 0
         }

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return sections.count
       }
       
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(sections[section] == "")
        {
            HomeVC.sect = 0
        }
           return sections[section]
       }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0)
        {
            return 400
        }
        else{
            return 300
        }
           
       }
}
