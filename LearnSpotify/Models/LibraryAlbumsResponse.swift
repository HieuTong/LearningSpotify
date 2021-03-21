//
//  LibraryAlbumsResponse.swift
//  LearnSpotify
//
//  Created by Le Tong Minh Hieu on 3/21/21.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
