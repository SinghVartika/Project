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



protocol MovieDescriptionDelegate : class
{
    func movieDetails(backDropPath : String , posterPath : String , title : String , releaseDate : String , voteAverage : Float , overview : String , type : Int)
}

class MovieTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var poster : UICollectionView!
    @IBOutlet weak var pagecontrols: UIPageControl!
    
    var view: UIViewController?
    
    var img = UIImage(named: "imdb")
    var responseModel: Trending?
    var popular: movie?
    var bestMovie: movie?
    var scifi: movie?
    var kid: movie?
    var adult: movie?
    var x = 1
    static var desc : Data?
    static var mov : details?
    
    weak var delegate: MovieDescriptionDelegate? = nil
    static var fav: [details?] = []
    static var type = -1
    var section = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        poster.dataSource = self
        poster.delegate = self
        
        getDataMovie2014()
        getDataPopular()
        getDataTrending()
        getDataKids()
        getDataSciFi()
        getDataAdult()
        
        
        let nib = UINib.init(nibName: "TrendingCollectionViewCell", bundle: nil)
        poster.register(nib, forCellWithReuseIdentifier: "TrendingCell")
        
        let nib1 = UINib.init(nibName: "OtherCollectionViewCell", bundle: nil)
        poster.register(nib1, forCellWithReuseIdentifier: "OtherCell")
        
    }
    
    //API call for trending section
    func getDataTrending() {
        
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
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
    
    //API call for Best movie section
    func getDataMovie2014() {
        
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        AF.request("https://api.themoviedb.org/3/discover/movie?with_genres=18&primary_release_year=2014&api_key=820016b7116f872f5f27bf56f9fdfb66", method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseData { [weak self] response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let result = try decoder.decode(movie.self, from: data)
                        self?.bestMovie = result
                        //print(result)
                    } catch { print(error) }
                }
                
                self?.poster.reloadData()
        }
    }
    
    //API call for popular movies
    func getDataPopular() {
        
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        AF.request("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=820016b7116f872f5f27bf56f9fdfb66", method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseData { [weak self] response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let result = try decoder.decode(movie.self, from: data)
                        self?.popular = result
                        //print(result)
                    } catch { print(error) }
                }
                
                self?.poster.reloadData()
        }
    }
    
    //API call for Science Fiction
    func getDataSciFi() {
        
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        AF.request("https://api.themoviedb.org/3/discover/movie?with_genres=878&sort_by=vote_average.desc&&api_key=820016b7116f872f5f27bf56f9fdfb66", method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseData { [weak self] response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let result = try decoder.decode(movie.self, from: data)
                        self?.scifi = result
                        //print(result)
                    } catch { print(error) }
                }
                
                self?.poster.reloadData()
        }
    }
    
    //API call for Kids Movies
    func getDataKids() {
        
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        AF.request("https://api.themoviedb.org/3/discover/movie?certification_country=US&certification.lte=G&sort_by=popularity.desc&&api_key=820016b7116f872f5f27bf56f9fdfb66", method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseData { [weak self] response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let result = try decoder.decode(movie.self, from: data)
                        self?.kid = result
                        //print(result)
                    } catch { print(error) }
                }
                
                self?.poster.reloadData()
        }
    }
    
    //API call for Age Restricted Movies
    func getDataAdult() {
        
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        AF.request("http://api.themoviedb.org/3/discover/movie?certification_country=US&certification=R&sort_by=vote_average.desc&&api_key=820016b7116f872f5f27bf56f9fdfb66", method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseData { [weak self] response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let result = try decoder.decode(movie.self, from: data)
                        self?.adult = result
                        //print(result)
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
        if (section == 0)
        {
            return CGSize(width: 300, height: 300)
        }
        else
        {
            return CGSize(width: 150, height: 250)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        poster.deselectItem(at: indexPath, animated: true)

        switch collectionView.tag
        {
        case 0:
            if responseModel!.results[indexPath.row].media_type == "tv"
            {
                delegate?.movieDetails(backDropPath: responseModel!.results[indexPath.row].backdrop_path ?? "", posterPath: responseModel!.results[indexPath.row].poster_path ?? "", title: responseModel!.results[indexPath.row].name ?? "", releaseDate: responseModel!.results[indexPath.row].first_air_date ?? "", voteAverage: responseModel!.results[indexPath.row].vote_average ?? 0.0, overview: responseModel!.results[indexPath.row].overview ?? "", type: 0)
            }
            else
            {
                delegate?.movieDetails(backDropPath: responseModel!.results[indexPath.row].backdrop_path ?? "", posterPath: responseModel!.results[indexPath.row].poster_path ?? "", title: responseModel!.results[indexPath.row].title ?? "", releaseDate: responseModel!.results[indexPath.row].release_date ?? "", voteAverage: responseModel!.results[indexPath.row].vote_average ?? 0.0, overview: responseModel!.results[indexPath.row].overview ?? "", type: 0)
            }
//            MovieTableViewCell.type = 0
//            MovieTableViewCell.desc = responseModel!.results[indexPath.row]
        case 1:
            delegate?.movieDetails(backDropPath: bestMovie!.results[indexPath.row].backdrop_path ?? "", posterPath: bestMovie!.results[indexPath.row].poster_path ?? "", title: bestMovie!.results[indexPath.row].title ?? "", releaseDate: bestMovie!.results[indexPath.row].release_date ?? "", voteAverage: bestMovie!.results[indexPath.row].vote_average ?? 0.0, overview: bestMovie!.results[indexPath.row].overview ?? "", type: 1)
//            MovieTableViewCell.type = 1
//            MovieTableViewCell.mov = bestMovie!.results[indexPath.row]
        case 2:
            delegate?.movieDetails(backDropPath: popular!.results[indexPath.row].backdrop_path ?? "", posterPath: popular!.results[indexPath.row].poster_path ?? "", title: popular!.results[indexPath.row].title ?? "", releaseDate: popular!.results[indexPath.row].release_date ?? "", voteAverage: popular!.results[indexPath.row].vote_average ?? 0.0, overview: popular!.results[indexPath.row].overview ?? "", type: 2)
//            MovieTableViewCell.type = 2
//            MovieTableViewCell.mov = popular!.results[indexPath.row]
        case  3:
            delegate?.movieDetails(backDropPath:  scifi!.results[indexPath.row].backdrop_path ?? "", posterPath: scifi!.results[indexPath.row].poster_path ?? "", title: scifi!.results[indexPath.row].title ?? "", releaseDate: scifi!.results[indexPath.row].release_date ?? "", voteAverage: scifi!.results[indexPath.row].vote_average ?? 0.0, overview: scifi!.results[indexPath.row].overview ?? "", type: 3)
//            MovieTableViewCell.type = 3
//            MovieTableViewCell.mov = scifi!.results[indexPath.row]
        case 4:
            delegate?.movieDetails(backDropPath:    kid!.results[indexPath.row].backdrop_path ?? "", posterPath: kid!.results[indexPath.row].poster_path ?? "", title: kid!.results[indexPath.row].title ?? "", releaseDate: kid!.results[indexPath.row].release_date ?? "", voteAverage: kid!.results[indexPath.row].vote_average ?? 0.0, overview: kid!.results[indexPath.row].overview ?? "", type: 4)
//            MovieTableViewCell.type = 4
//            MovieTableViewCell.mov = kid!.results[indexPath.row]
        default:
            delegate?.movieDetails(backDropPath:  adult!.results[indexPath.row].backdrop_path ?? "", posterPath: adult!.results[indexPath.row].poster_path ?? "", title: adult!.results[indexPath.row].title ?? "", releaseDate: adult!.results[indexPath.row].release_date ?? "", voteAverage: adult!.results[indexPath.row].vote_average ?? 0.0, overview: adult!.results[indexPath.row].overview ?? "", type: 5)
//            MovieTableViewCell.type = 5
//            MovieTableViewCell.mov = adult!.results[indexPath.row]
        }
        
        //print (HomeVC.desc!)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var str : String
        if (collectionView.tag != 0)
        {
            pagecontrols.isHidden = true
        }
        if collectionView.tag == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath) as! TrendingCollectionViewCell
            str = "https://image.tmdb.org/t/p/w500\(responseModel?.results[indexPath.row].poster_path ?? "")"
            let URL = NSURL(string: str)!
            cell.poster_mov(img: URL)
            return cell
        }
        else if collectionView.tag == 1
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherCell", for: indexPath) as! OtherCollectionViewCell
            
            str = "https://image.tmdb.org/t/p/w500\(bestMovie?.results[indexPath.row].poster_path ?? "" )"
            let URL = NSURL(string: str)!
            cell.mov_image.af_setImage(withURL: URL as URL)
            cell.mov_image.contentMode = .scaleAspectFill
            
            cell.title(ttl: bestMovie?.results[indexPath.row].title ?? "")
            cell.movType(typ: "Adventure")
            
            cell.movRating(rtn: String(describing: bestMovie?.results[indexPath.row].vote_average ?? 0))
            return cell
        }
            
        else if collectionView.tag == 2
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherCell", for: indexPath) as! OtherCollectionViewCell
            
            str = "https://image.tmdb.org/t/p/w500\(popular?.results[indexPath.row].poster_path ?? "")"
            let URL = NSURL(string: str)!
            cell.mov_image.af_setImage(withURL: URL as URL)
            cell.mov_image.contentMode = .scaleAspectFill
            
            cell.title(ttl: popular?.results[indexPath.row].title ?? "")
            cell.movType(typ: "Adventure")
            
            cell.movRating(rtn: String(describing: popular?.results[indexPath.row].vote_average ?? 0))
            return cell
        }
        else if collectionView.tag == 3
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherCell", for: indexPath) as! OtherCollectionViewCell
            
            str = "https://image.tmdb.org/t/p/w500\(scifi?.results[indexPath.row].poster_path ?? "" )"
            let URL = NSURL(string: str)!
            cell.mov_image.af_setImage(withURL: URL as URL)
            cell.mov_image.contentMode = .scaleAspectFill
            
            cell.title(ttl: scifi?.results[indexPath.row].title ?? "")
            cell.movType(typ: "Science Fiction")
            
            cell.movRating(rtn: String(describing: scifi?.results[indexPath.row].vote_average ?? 0))
            return cell
        }
            
        else if collectionView.tag == 4
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherCell", for: indexPath) as! OtherCollectionViewCell
            
            str = "https://image.tmdb.org/t/p/w500\(kid?.results[indexPath.row].poster_path ?? "" )"
            let URL = NSURL(string: str)!
            cell.mov_image.af_setImage(withURL: URL as URL)
            cell.mov_image.contentMode = .scaleAspectFill
            
            cell.title(ttl: kid?.results[indexPath.row].title ?? "")
            cell.movType(typ: "Kids")
            
            cell.movRating(rtn: String(describing: kid?.results[indexPath.row].vote_average ?? 0))
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherCell", for: indexPath) as! OtherCollectionViewCell
            
            str = "https://image.tmdb.org/t/p/w500\(adult?.results[indexPath.row].poster_path ?? "")"
            let URL = NSURL(string: str)!
            cell.mov_image.af_setImage(withURL: URL as URL)
            cell.mov_image.contentMode = .scaleAspectFill
            
            cell.title(ttl: adult?.results[indexPath.row].title ?? "")
            cell.movType(typ: "R-Rated")
            
            cell.movRating(rtn: String(describing: adult?.results[indexPath.row].vote_average ?? 0))
            return cell
        }
    }
    
    
    
    //Timer for the controller
    func setTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(MovieTableViewCell.autoScroll), userInfo: nil,
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
