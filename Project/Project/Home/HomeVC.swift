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
    static var sect : Int? = 0
    var sections = [ "" , "Best Movies","Popular","Science Fiction","Kids","Age Restricted"]
    
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
            switch  indexPath.section
            {
            case 0:
                cell.section = 0
            case 1:
                cell.section = 1
            case 2:
                cell.section = 2
            default:
                cell.section = 3
            }
            if(indexPath.section == 0)
            {
                cell.setTimer()
            }
            else
            {
                cell.pagecontrols.isHidden = true
            }
            cell.view = self
            cell.delegate = self
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
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if let cell = cell as? MovieTableViewCell
            {
                
                cell.poster.tag = indexPath.section
                cell.poster.reloadData()
            }
        }
    }

extension HomeVC : MovieDescriptionDelegate
{
    func movieDetails(backDropPath: String, posterPath: String, title: String, releaseDate: String, voteAverage: Float, overview: String, type: Int)
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MoviedescVC") as! MoviedescVC
        
        vc.modalPresentationStyle = .fullScreen
        vc.movieDescription = overview
        vc.movieName = title
        vc.movRating = String(voteAverage)
        vc.movLanguage = "English"
        vc.posterPath = "https://image.tmdb.org/t/p/w500\(backDropPath)"
        
        vc.movYear =  String(releaseDate.prefix(4))
        vc.movType = type
        
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    
}
