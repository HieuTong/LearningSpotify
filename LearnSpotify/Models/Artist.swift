//
//  Artist.swift
//  LearnSpotify
//
//  Created by HieuTong on 3/8/21.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String:String]
}
