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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print (HomeVC.desc!)
        if(MovieTableViewCell.type == 1)
        {
            let URL = NSURL(string: "https://image.tmdb.org/t/p/w500\(MovieTableViewCell.mov!.backdrop_path!)")!
            movImage.af_setImage(withURL: URL as URL)
            movImage.contentMode = .scaleAspectFill
            movName.text = MovieTableViewCell.mov!.title
            year.text = String((MovieTableViewCell.mov!.release_date)!.prefix(4))
            rating.text = String(describing: (MovieTableViewCell.mov!.vote_average)!)
            aboutMovie.text = MovieTableViewCell.mov!.overview
            if(MovieTableViewCell.mov?.original_language == "en")
            {
                language.text = "English"
            }
            else
            {
                language.text = "Others"
            }
        }
        else
        {
            let URL = NSURL(string: "https://image.tmdb.org/t/p/w500\(MovieTableViewCell.desc!.backdrop_path!)")!
            movImage.af_setImage(withURL: URL as URL)
            movImage.contentMode = .scaleAspectFill
            if(MovieTableViewCell.desc?.media_type == "tv")
            {
                movName.text = MovieTableViewCell.desc!.name
                year.text = String((MovieTableViewCell.desc!.first_air_date)!.prefix(4))
            }
            else
            {
                movName.text = MovieTableViewCell.desc!.title
                year.text = String((MovieTableViewCell.desc!.release_date)!.prefix(4))
            }
            rating.text = String(describing: (MovieTableViewCell.desc!.vote_average)!)
            aboutMovie.text = MovieTableViewCell.desc!.overview
            if(MovieTableViewCell.desc?.original_language == "en")
            {
                language.text = "English"
            }
            else
            {
                language.text = "Others"
            }
            
        }
    }
    
}
