//
//  MovieModels.swift
//  Project
//
//  Created by TTN on 14/06/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import Foundation

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
    var overview: String?
}
