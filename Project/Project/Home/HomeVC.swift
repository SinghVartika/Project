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

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var poster : UICollectionView!
    @IBOutlet weak var pagecontrols: UIPageControl!
    @IBOutlet weak var movSection: UITableView!
    var responseModel: Trending?
    var x = 1
    static var desc : Data?
    var sections = [ "" , "Action","Drama","Science Fiction","Kids","Horror"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        poster.dataSource = self
        poster.delegate = self
        
        movSection.dataSource = self
        movSection.delegate = self
        self.setTimer()
        
        let nib = UINib.init(nibName: "TrendingCollectionViewCell", bundle: nil)
        poster.register(nib, forCellWithReuseIdentifier: "TrendingCell")
        
        let nib1 = UINib.init(nibName: "MovieTableViewCell", bundle: nil)
        movSection.register(nib1, forCellReuseIdentifier: "MovieCell")
        
    }
    //API call
    func getData() {
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
        return responseModel?.results.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        HomeVC.desc = responseModel!.results[indexPath.row]
        //print (HomeVC.desc!)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MoviedescVC")
        self.navigationController!.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath) as! TrendingCollectionViewCell
        
        //Fetching the image
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(responseModel!.results[indexPath.row].poster_path!)") {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        
                        //here it pass the image to the cell.
                        cell.poster_mov(img: UIImage(data: data)!)
                    }
                }
            }.resume()
        }
        
        
        return cell
        
    }
    
    //Timer for the controller
    func setTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(HomeVC.autoScroll), userInfo: nil,
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
    
    //MARK: Table view for the other sections
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return sections.count
       }
       
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return sections[section]
       }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 200
       }
}
