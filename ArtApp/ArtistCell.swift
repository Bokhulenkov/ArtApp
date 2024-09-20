//
//  ArtistCell.swift
//  Art App
//
//  Created by Alexander on 16.09.2024.
//

import UIKit

class ArtistCell: UICollectionViewCell {
    
    static let identifier = ArtistCell.description()
    
    // MARK: - UI
    
    private let nameArtist: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioArtist: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageArtist: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    //    MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setings UI
    
    private func setUI() {
        
        contentView.addSubview(nameArtist)
        contentView.addSubview(imageArtist)
        contentView.addSubview(bioArtist)
        
        contentView.backgroundColor = .blue
        contentView.clipsToBounds = false
    }
    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//           return contentView.systemLayoutSizeFitting(CGSize(width: self.bounds.size.width, height: self.bounds.size.height))
//       }
    
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            nameArtist.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameArtist.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameArtist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            imageArtist.topAnchor.constraint(equalTo: nameArtist.bottomAnchor, constant: 5),
            imageArtist.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            bioArtist.topAnchor.constraint(equalTo: imageArtist.bottomAnchor, constant: 5),
            bioArtist.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bioArtist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bioArtist.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    
    
    
    public func configureCell(artist: Artist) {
        nameArtist.text = artist.name
        imageArtist.image = UIImage(named: artist.image)
        bioArtist.text = artist.bio
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameArtist.text = nil
        imageArtist.image = nil
        bioArtist.text = nil
    }
    
}
