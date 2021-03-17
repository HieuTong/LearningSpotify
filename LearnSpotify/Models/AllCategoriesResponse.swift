//
//  AllCategoriesResponse.swift
//  LearnSpotify
//
//  Created by Le Tong Minh Hieu on 3/16/21.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}

