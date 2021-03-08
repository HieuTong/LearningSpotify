//
//  ViewController.swift
//  LearnSpotify
//
//  Created by Le Tong Minh Hieu on 3/5/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        
        fetchData()
    }
    
    private func fetchData() {
//        APICaller.shared.getNewRelease { (result) in
//            switch result {
//            case .success(let model): break
//            case .failure(let error): break
//            }
//        }
//        APICaller.shared.getFeaturedPlaylists { (_) in
//
//        }
        
        APICaller.shared.getRecommenderGenres { (result) in
            switch result {
                case .success(let model): 
                    let genres = model.genres
                    var seeds = Set<String>()
                    while seeds.count < 5 {
                        if let random = genres.randomElement() {
                            seeds.insert(random)
                        }
                    }
                    
                    APICaller.shared.getRecommendations(genres: seeds) { (_) in
                        
                    }
                case .failure(let error): break
            }
        }
    }

    @objc func didTapSettings() {
        let vc = SettingViewController()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        push(vc)
    }
    
}

