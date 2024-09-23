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
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioArtist: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageArtist: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
        
        contentView.clipsToBounds = false
        
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            nameArtist.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameArtist.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameArtist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            imageArtist.topAnchor.constraint(equalTo: nameArtist.bottomAnchor),
            imageArtist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageArtist.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            bioArtist.topAnchor.constraint(equalTo: imageArtist.bottomAnchor, constant: 5),
            bioArtist.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bioArtist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bioArtist.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        bioArtist.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        nameArtist.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
    }
    
    public func configureCell(artist: Artist) {
        self.nameArtist.text = artist.name
        self.imageArtist.image = UIImage(named: artist.image)
        self.bioArtist.text = artist.bio
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameArtist.text = nil
        imageArtist.image = nil
        bioArtist.text = nil
    }
    
}

// MARK: - Extensions

//extension ArtistCell {
//    class func getProguctHieghtForWidth(artist: Artist, width: CGFloat) -> CGFloat {
//        
//        // magic numbers explanation:
//          // 16 - offset between bio and image
//          // 22 - height of title
//          // 8 - offset between image and title
//          var resultingHeight: CGFloat = 16 + 22 + 8
//        
////        get image height based on width and aspect ratio
//        let imageHeight = width * 2/3
//        resultingHeight += imageHeight
//        
//        let nameHeight = artist.name.getHeight(
//            font: .systemFont(ofSize: 22), width: width
//        )
//        
//        let bioHeight = artist.bio.getHeight(
//            font: .systemFont(ofSize: 14), width: width
//        )
//        
//        resultingHeight += nameHeight
//        resultingHeight += bioHeight
//        return resultingHeight
//    }
//}

//extension String {
//  func getHeight(font: UIFont, width: CGFloat) -> CGFloat {
//  let attributes: [NSAttributedString.Key: Any] = [
//    .font: font
//  ]
//  let attributedText = NSAttributedString(string: self, attributes:
//    attributes)
//  let constraintBox = CGSize(width: width, height:
//    .greatestFiniteMagnitude)
//  let textHeight = attributedText.boundingRect(
//    with: constraintBox, options: [.usesLineFragmentOrigin,
//    .usesFontLeading], context: nil)
//    .height.rounded(.up)
//  return textHeight
//  }
//}
