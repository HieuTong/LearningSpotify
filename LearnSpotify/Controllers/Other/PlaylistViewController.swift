//
//  PlaylistViewController.swift
//  LearnSpotify
//
//  Created by Le Tong Minh Hieu on 3/5/21.
//

import UIKit

class PlaylistViewController: UIViewController {

    private let playList: Playlist
    
    init(playlist: Playlist) {
        self.playList = playlist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = playList.name
        view.backgroundColor = .systemBackground
    }

}
