//
//  MovieModel.swift
//  CombineFramework
//
//  Created by Tolga İskender on 18.04.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
    var search: [Search]?
    var totalResults, response: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

struct Search: Codable {
    var title, year, imdbID: String?
    var type: TypeEnum?
    var poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}
