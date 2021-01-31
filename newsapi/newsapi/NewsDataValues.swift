//
//  NewsDataValues.swift
//  newsapi
//
//  Created by iosdev on 30.11.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation


struct News:Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Articles]?
}

struct Articles: Codable{
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: URL?
    var urlToImage: URL?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable{
    var id: String?
    var name: String?
}
