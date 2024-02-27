//
//  Model.swift
//  NewsAPI
//
//  Created by Rakymzhan Zhabagin on 26.02.2024.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

struct News: Hashable, Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?

    struct Source: Hashable, Codable {
        let id: String?
        let name: String
    }
}

// Constans 
struct APIConstants {
    static let topHeadlines = "top-headlines"
    static let everything = "everything"
    
    struct Sources {
            static let bbcNews = "bbc-news"
    }
    
    static let url = "https://newsapi.org/v2"
    static let country = "us"
    static let apiKey = "e65ee0938a2a43ebb15923b48faed18d   "
//    static let apiKey = "e65ee0938a2a43ebb15923b48faed18d"
}
