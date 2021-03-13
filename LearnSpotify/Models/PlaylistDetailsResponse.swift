//
//  PlaylistDetailsResponse.swift
//  LearnSpotify
//
//  Created by Le Tong Minh Hieu on 3/13/21.
//

import Foundation

struct PlaylistDetailsResponse: Codable {
    let description: String
    let external_urls: [String:String]
    let id: String
    let images: [APIImage]
    let name: String
    let tracks: PlaylistTracksResponse
}


struct PlaylistTracksResponse: Codable {
    let items: [PlaylistItem]
}

struct PlaylistItem: Codable {
    let track: AudioTrack
}
