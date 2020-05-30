//
//  MoviedescVC.swift
//  Project
//
//  Created by TTN on 22/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MoviedescVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var movImage : UIImageView!
    @IBOutlet weak var movName : UILabel!
    @IBOutlet weak var rating : UILabel!
    @IBOutlet weak var language : UILabel!
    @IBOutlet weak var year : UILabel!
    @IBOutlet weak var aboutMovie : UILabel!
    @IBOutlet weak var extra : UICollectionView!
    
    var result: Trending?
    var mov: movie?
    var newfav: [String] = []
    var views: UIViewController?
    var favListArray: [[String]] = []
    var counter : Int = 0
    
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        
        //User default for saving the movie list
        if UserDefaults.standard.object(forKey: "count") != nil{
            counter = UserDefaults.standard.object(forKey: "count") as! Int
        }
        if UserDefaults.standard.object(forKey: "favList") != nil {
            favListArray = UserDefaults.standard.object(forKey: "favList") as! [[String]]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print (HomeVC.desc!)
        extra.dataSource = self
        extra.delegate = self
        views = self
        let nib = UINib.init(nibName: "PosterCollectionViewCell", bundle: nil)
        extra.register(nib, forCellWithReuseIdentifier: "movPosterCell")
        getData()
        
         
        
        if MovieTableViewCell.type == 0
        {
            
            newfav.append(MovieTableViewCell.desc?.backdrop_path ?? "")
            newfav.append(MovieTableViewCell.desc?.poster_path ?? "")
            
            let URL = NSURL(string: "https://image.tmdb.org/t/p/w500\(MovieTableViewCell.desc!.backdrop_path!)")!
            movImage.af_setImage(withURL: URL as URL)
            movImage.contentMode = .scaleAspectFill
            if(MovieTableViewCell.desc?.media_type == "tv")
            {
                newfav.append(MovieTableViewCell.desc?.name ?? "")
                newfav.append(MovieTableViewCell.desc!.first_air_date ?? "")
                movName.text = MovieTableViewCell.desc!.name
                year.text = String((MovieTableViewCell.desc!.first_air_date)!.prefix(4))
            }
            else
            {
                newfav.append(MovieTableViewCell.desc?.title ?? "")
                newfav.append(MovieTableViewCell.desc!.release_date ?? "")
                movName.text = MovieTableViewCell.desc!.title
                year.text = String((MovieTableViewCell.desc!.release_date)!.prefix(4))
            }
            
            newfav.append(String(describing : MovieTableViewCell.desc!.vote_average ?? 0))
            newfav.append(MovieTableViewCell.desc!.overview ?? "")
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
        else
        {
            
            newfav.append(MovieTableViewCell.mov?.backdrop_path ?? "")
            newfav.append(MovieTableViewCell.mov?.poster_path ?? "")
            newfav.append(MovieTableViewCell.mov?.title ?? "")
            newfav.append(MovieTableViewCell.mov?.release_date ?? "")
            newfav.append(String(describing: (MovieTableViewCell.mov!.vote_average) ?? 0))
            newfav.append(MovieTableViewCell.mov?.overview ?? "")
            
            if MovieTableViewCell.mov!.backdrop_path != nil
            {
            let URL = NSURL(string: "https://image.tmdb.org/t/p/w500\(MovieTableViewCell.mov!.backdrop_path!)")!
            movImage.af_setImage(withURL: URL as URL)
            movImage.contentMode = .scaleAspectFill
            }
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
        if favListArray.contains(newfav) {
            favButton.setImage(UIImage(named: "FilledHeart.png"), for: .normal)

        }else{
            favButton.setImage(UIImage(named: "EmptyHeart.png"), for: .normal)
        }
        favButton.contentMode = .scaleAspectFit
        
    }
    
    //MARK: API call for the bottom collection view
    func getData() {
        
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        let str : String
       if MovieTableViewCell.type == 0
       {
            str = "https://api.themoviedb.org/3/trending/all/day?api_key=820016b7116f872f5f27bf56f9fdfb66"
        }
        
        else if MovieTableViewCell.type == 1
       {
            str = "https://api.themoviedb.org/3/discover/movie?with_genres=18&primary_release_year=2014&api_key=820016b7116f872f5f27bf56f9fdfb66"
        }
        
        else if MovieTableViewCell.type == 2
       {
            str = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=820016b7116f872f5f27bf56f9fdfb66"
        }
        
        else if MovieTableViewCell.type == 3
       {
            str = "https://api.themoviedb.org/3/discover/movie?with_genres=878&sort_by=vote_average.desc&&api_key=820016b7116f872f5f27bf56f9fdfb66"
        }
        else if MovieTableViewCell.type == 4
       {
            str = "https://api.themoviedb.org/3/discover/movie?certification_country=US&certification.lte=G&sort_by=popularity.desc&&api_key=820016b7116f872f5f27bf56f9fdfb66"
        }
        else
       {
            str = "http://api.themoviedb.org/3/discover/movie?certification_country=US&certification=R&sort_by=vote_average.desc&&api_key=820016b7116f872f5f27bf56f9fdfb66"
        }
        AF.request(str , method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseData { [weak self] response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let result = try decoder.decode(movie.self, from: data)
                        self?.mov = result
                        //print(result)
                    } catch { print(error) }
                }
                
                self?.extra.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movPosterCell", for: indexPath) as! PosterCollectionViewCell
            
            let str = "https://image.tmdb.org/t/p/w500\(mov?.results[indexPath.row].backdrop_path ?? "")"
            let URL = NSURL(string: str)!
            cell.poster.af_setImage(withURL: URL as URL)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            MovieTableViewCell.mov = mov?.results[indexPath.row]
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MoviedescVC")
        views?.navigationController!.pushViewController(vc, animated: true)

    }
    
    
    //MARK: Making a movie as a favourite one
    @IBAction func fav(_ sender: Any) {
        
        if favListArray.contains(newfav) {
            favListArray.remove(at: favListArray.firstIndex(of: newfav)!)
            counter = counter - 1
        }
        
        else{
            counter = counter + 1
            favListArray.append(newfav)
        }

        UserDefaults.standard.set(counter, forKey: "count")
        UserDefaults.standard.set(favListArray, forKey: "favList")
        
        if favListArray.contains(newfav) {
            favButton.setImage(UIImage(named: "FilledHeart.png"), for: .normal)

        }else{
            favButton.setImage(UIImage(named: "EmptyHeart.png"), for: .normal)
        }
        favButton.contentMode = .scaleAspectFit
        
    }
    
}


