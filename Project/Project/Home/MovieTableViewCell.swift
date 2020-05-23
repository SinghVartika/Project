//
//  MovieTableViewCell.swift
//  Project
//
//  Created by TTN on 22/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

struct Trending: Codable{
    let page: Int?
    let results: [Data]
}

struct Data: Codable {
    var id: Int?
    var video: Bool?
    var vote_count: Int?
    var vote_average: Float?
    var title: String?
    var name: String?
    var release_date: String?
    var original_language: String?
    var original_title: String?
    var backdrop_path: String?
    var original_name: String?
    var first_air_date: String?
    var adult: Bool?
    var overview: String?
    var poster_path: String?
    var popularity: Float?
    var media_type: String?
}

struct movie: Codable
{
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [details]
}

struct details: Codable
{
    var popularity: Float?
    var vote_count: Int?
    var video: Bool?
    var vote_average: Float?
    var title: String?
    var release_date: String?
    var original_language: String?
    var original_title: String?
    var backdrop_path: String?
    var adult: Bool?
    var poster_path: String?
    var id: Int?
}

class MovieTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var poster : UICollectionView!
    @IBOutlet weak var pagecontrols: UIPageControl!
    
    var img = UIImage(named: "imdb")
    var responseModel: Trending?
    var bestDrama: movie?
    var x = 1
    static var desc : Data?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        getDataBestDrama()
        getDataTrending()
        
        poster.dataSource = self
        poster.delegate = self
        
        self.setTimer()
        
        let nib = UINib.init(nibName: "TrendingCollectionViewCell", bundle: nil)
        poster.register(nib, forCellWithReuseIdentifier: "TrendingCell")
        
        let nib1 = UINib.init(nibName: "OtherCollectionViewCell", bundle: nil)
        poster.register(nib1, forCellWithReuseIdentifier: "OtherCell")
        
    }
    
    //API call for trending section
    func getDataTrending() {
        AF.request("https://api.themoviedb.org/3/trending/all/day?api_key=820016b7116f872f5f27bf56f9fdfb66", method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseData { [weak self] response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let result = try decoder.decode(Trending.self, from: data)
                        self?.responseModel = result
                        //print(result)
                    } catch { print(error) }
                }
                
                self?.poster.reloadData()
        }
    }
    
    //API call for Best Drama section
    func getDataBestDrama() {
        AF.request("https://api.themoviedb.org/3/discover/movie?with_genres=18&sort_by=vote_average.desc&vote_count.gte=10&api_key=820016b7116f872f5f27bf56f9fdfb66", method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseData { [weak self] response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let result = try decoder.decode(movie.self, from: data)
                        self?.bestDrama = result
                        print(result)
                    } catch { print(error) }
                }
                
                self?.poster.reloadData()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0)
        {
            return responseModel?.results.count ?? 0
        }
        else
        {
            return 10
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        MovieTableViewCell.desc = responseModel!.results[indexPath.row]
        //print (HomeVC.desc!)
        
        //        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        //        let vc = storyboard.instantiateViewController(withIdentifier: "MoviedescVC")
        //        self.navigationController!.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var str : String
        
        switch(indexPath.row)
        {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath) as! TrendingCollectionViewCell
            str = "https://image.tmdb.org/t/p/w500\(responseModel!.results[indexPath.row].poster_path!)"
            let URL = NSURL(string: str)!
            cell.poster_mov(img: URL)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherCell", for: indexPath) as! OtherCollectionViewCell
            //            if(bestDrama!.results[indexPath.row].poster_path != nil)
            //            {
            //            str = "https://image.tmdb.org/t/p/w500\(bestDrama!.results[indexPath.row].poster_path!)"
            //            let URL = NSURL(string: str)!
            //            cell.poster_mov(img: URL)
            //            }
            //            else
            //            {
            //                cell.mov_image.image = img
            //            }
            
//            cell.title(ttl: bestDrama!.results[indexPath.row].title!)
//            
//            
//            cell.movRating(rtn: String(describing: bestDrama!.results[indexPath.row].popularity!))
            return cell
            //        movImage.af_setImage(withURL: URL as URL)
        }
    }
    
    //Timer for the controller
    func setTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(MovieTableViewCell.autoScroll), userInfo: nil,
                                     repeats: true)
    }
    
    //Setup of the flow between the pages
    @objc func autoScroll() {
        pagecontrols.numberOfPages = responseModel?.results.count ?? 0
        self.pagecontrols.currentPage = x
        if self.x < responseModel?.results.count ?? 0 {
            let indexPath = IndexPath(item: x, section: 0)
            self.poster.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.x = self.x + 1
        } else {
            self.x = 0
            self.poster.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
}
