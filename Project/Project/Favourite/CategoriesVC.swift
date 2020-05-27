//
//  CategoriesVC.swift
//  Project
//
//  Created by TTN on 20/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var favMovies: UITableView!
    
    var favListArray : [[String]] = []
    var Counter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My favourite Movies"
        favMovies.dataSource = self
        favMovies.delegate = self
        
        let nib = UINib.init(nibName: "FavTableViewCell", bundle: nil)
        favMovies.register(nib, forCellReuseIdentifier: "favCell")
        
        //self.favMovies.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        favListArray = UserDefaults.standard.object(forKey: "favList") as! [[String]]
        Counter = UserDefaults.standard.object(forKey: "count") as! Int
        self.favMovies.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavTableViewCell
        
        let URL = NSURL(string: "https://image.tmdb.org/t/p/w500\(favListArray[indexPath.row][1])")!
        cell.img.af_setImage(withURL: URL as URL)
        cell.movRating(rtn: favListArray[indexPath.row][4])
        cell.title(ttl: favListArray[indexPath.row][2])
          return cell
    }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
           
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
