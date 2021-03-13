//
//  File.swift
//  LearnSpotify
//
//  Created by Le Tong Minh Hieu on 3/13/21.
//

import UIKit

class TitleHeaderCollectionResuableView: UICollectionReusableView {
    static let identifier = "TitleHeaderCollectionResuableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
