//
//  FeaturedPlaylistCollectionViewCell.swift
//  LearnSpotify
//
//  Created by HieuTong on 3/10/21.
//

import UIKit
import SDWebImage

class FeaturedPlaylistCollectionViewCell: BaseCollectionCell {
    static let identifier = "FeaturedPlaylistCollectionViewCell"

    private let playListCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let playListNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let creatorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .secondarySystemBackground

        creatorNameLabel.frame = CGRect(x: 3, y: contentView.height - 30, width: contentView.width - 6, height: 30)
        playListNameLabel.frame = CGRect(x: 3, y: contentView.height - 60, width: contentView.width - 6, height: 30)
        
        let imageSize = contentView.height - 70
        playListCoverImageView.frame = CGRect(x: (contentView.width - imageSize) / 2, y: 3, width: imageSize, height: imageSize)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playListNameLabel.text = nil
        playListCoverImageView.image = nil
        creatorNameLabel.text = nil
    }
    
    func configure(with viewModel: FeaturedPlayListCellViewModel) {
        playListNameLabel.text = viewModel.name
        playListCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        creatorNameLabel.text = viewModel.creatorName
    }
    
    override func setupView() {
        contentView.addSubview(playListCoverImageView)
        contentView.addSubview(playListNameLabel)
        contentView.addSubview(creatorNameLabel)
        contentView.clipsToBounds = true
    }
}
