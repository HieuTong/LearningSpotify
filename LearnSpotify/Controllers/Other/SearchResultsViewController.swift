//
//  SearchResultsViewController.swift
//  LearnSpotify
//
//  Created by Le Tong Minh Hieu on 3/5/21.
//

import UIKit

struct SearchSection {
    let title: String
    let results: [SearchResult]
}

protocol SearchResultsViewControllerDelegate: NSObjectProtocol {
    func didTapResult(_ result: SearchResult)
}

class SearchResultsViewController: UIViewController {

    private var sections: [SearchSection] = []
    
    private let tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.backgroundColor = .systemBackground
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(tableView)
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    weak var delegate: SearchResultsViewControllerDelegate?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func update(with results: [SearchResult]) {
        let artists = results.filter({
            switch $0 {
                case .artist: return true
                default: return false
            }
        })
        
        let albums = results.filter({
            switch $0 {
                case .album: return true
                default: return false
            }
        })
        
        let playlists = results.filter({
            switch $0 {
                case .playlist: return true
                default: return false
            }
        })
        
        let tracks = results.filter({
            switch $0 {
                case .track: return true
                default: return false
            }
        })
        
        self.sections = [
            SearchSection(title: "Songs", results: tracks),
            SearchSection(title: "Artists", results: artists),
            SearchSection(title: "Albums", results: albums),
            SearchSection(title: "Playlists", results: playlists)
        ]
        
        tableView.reloadData()
        tableView.isHidden = results.isEmpty
    }
}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = sections[indexPath.section].results[indexPath.row]
        let acell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch result {
            case .artist(let model):
                acell.textLabel?.text = model.name
            case .album(let model):
                acell.textLabel?.text = model.name
            case .playlist(let model):
                acell.textLabel?.text = model.name
            case .track(let model):
                acell.textLabel?.text = model.name
        }
        return acell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = sections[indexPath.section].results[indexPath.row]
        delegate?.didTapResult(result)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    
}
