//
//  TrendingResults.swift
//  MovieList
//
//  Created by Silvana Rodrigues Alves on 04/02/24.
//

import Foundation

struct TrendingResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
