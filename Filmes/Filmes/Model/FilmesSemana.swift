//
//  FilmesSemana.swift
//  Filmes
//
//  Created by Jaqueline Bittencourt Santos on 28/03/21.
//

import Foundation

// MARK: - FilmesSemana
struct FilmesSemana: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let genreIDS: [Int]
    let title: String?
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let posterPath: String
    let video: Bool?
    let voteAverage: Double
    let overview: String
    let releaseDate: String?
    let voteCount, id: Int
    let adult: Bool?
    let backdropPath: String
    let popularity: Double
    let mediaType: MediaType
    let originCountry: [String]?
    let firstAirDate, name, originalName: String?

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case id, adult
        case backdropPath = "backdrop_path"
        case popularity
        case mediaType = "media_type"
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
        case name
        case originalName = "original_name"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
}
