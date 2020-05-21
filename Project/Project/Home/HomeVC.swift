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
    var release_date: String?
    var original_language: String?
    var original_title: String?
    var backdrop_path: String?
    var adult: Bool?
    var overview: String?
    var poster_path: String?
    var popularity: Float?
    var media_type: String?
}

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var poster : UICollectionView!
    @IBOutlet weak var pagecontrols: UIPageControl!
    var responseModel: Trending?
    var x = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        poster.dataSource = self
        poster.delegate = self
        self.setTimer()
        
        let nib = UINib.init(nibName: "TrendingCollectionViewCell", bundle: nil)
        poster.register(nib, forCellWithReuseIdentifier: "TrendingCell")
        
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
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath) as! TrendingCollectionViewCell
        
//        cell.mov_poster(path: responseModel!.results[indexPath.row].poster_path!)
        
                
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(responseModel!.results[indexPath.row].poster_path!)") {
        
                    URLSession.shared.dataTask(with: url) { (data, response, error) in
                        if let data = data {
                            DispatchQueue.main.async {
        
                                //here it pass the image to the cell.
                                cell.poster_mov(img: UIImage(data: data)!)
                                //cell.move_img.contentMode = .scaleAspectFit
                            }
                        }
                    }.resume()
                }
        
        
        return cell
        
    }
    
    func setTimer() {
          let _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(HomeVC.autoScroll), userInfo: nil,
    repeats: true)
      }
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
