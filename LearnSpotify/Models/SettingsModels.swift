//
//  SettingsModels.swift
//  LearnSpotify
//
//  Created by HieuTong on 3/7/21.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
