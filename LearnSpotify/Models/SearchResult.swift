//
//  SearchResult.swift
//  LearnSpotify
//
//  Created by HieuTong on 3/18/21.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
