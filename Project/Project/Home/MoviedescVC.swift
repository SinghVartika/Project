//
//  MoviedescVC.swift
//  Project
//
//  Created by TTN on 22/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviedescVC: UIViewController {

    @IBOutlet weak var movImage : UIImageView!
    @IBOutlet weak var movName : UILabel!
    @IBOutlet weak var rating : UILabel!
    @IBOutlet weak var language : UILabel!
    @IBOutlet weak var year : UILabel!
    @IBOutlet weak var aboutMovie : UILabel!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //print (HomeVC.desc!)
//        let URL = NSURL(string: "https://image.tmdb.org/t/p/w500\(MovieTableViewCell.desc!.backdrop_path!)")!
//        movImage.af_setImage(withURL: URL as URL)
//        movImage.contentMode = .scaleAspectFill
//        if(MovieTableViewCell.desc?.media_type == "tv")
//        {
//            movName.text = MovieTableViewCell.desc!.name
//            year.text = String((MovieTableViewCell.desc!.first_air_date)!.prefix(4))
//        }
//        else
//        {
//            movName.text = MovieTableViewCell.desc!.title
//            year.text = String((MovieTableViewCell.desc!.release_date)!.prefix(4))
//        }
//        rating.text = String(describing: (MovieTableViewCell.desc!.vote_average)!)
//        aboutMovie.text = MovieTableViewCell.desc!.overview
//        if(MovieTableViewCell.desc?.original_language == "en")
//        {
//            language.text = "English"
//        }
//        else
//        {
//            language.text = "Others"
//        }
//
//
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
}
