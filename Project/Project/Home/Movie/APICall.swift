//
//  APICall.swift
//  Project
//
//  Created by TTN on 12/06/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import Foundation

struct  CallApi {
    
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
}
