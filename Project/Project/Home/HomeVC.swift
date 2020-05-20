//
//  Home.swift
//  Project
//
//  Created by TTN on 20/03/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Alamofire

struct Trending: Codable{
    let page: String?
    let data: [Result]
}

struct Result: Codable {
    var id: String?
    var video: String?
    var vote_count: String?
    var vote_average: String?
    var title: String?
    var genre_id: [Int]
    var release_date: String?
    var original_language: String?
    var original_title: String?
    var backdrop_path: String?
    var adult: String?
    var overview: String?
    var poster_path: String?
    var popularity: String?
    var media_type: String?
}

class HomeVC: UIViewController {
    
    var responseModel: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
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
                        let result = try decoder.decode(Result.self, from: data)
                        self?.responseModel = result
                        print(result)
                    } catch { print(error) }
                }
                
                //                        self?.employeesTableView.reloadData()
        }
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
