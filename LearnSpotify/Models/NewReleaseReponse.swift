//
//  NewReleaseReponse.swift
//  LearnSpotify
//
//  Created by HieuTong on 3/7/21.
//

import Foundation

struct NewReleaseReponse: Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    let items: [Album]
}

struct Album: Codable {
    let album_type: String
    let available_markets: [String]
    let id: String
    var images: [APIImage]
    let name: String
    let release_date: String
    let total_tracks: Int
    let artists: [Artist]
}
