//
//  ViewController.swift
//  Art App
//
//  Created by Alexander on 16.09.2024.
//
/*
 На главной странице показываем авторов с краткой биографией, при нажатии на автора переходим на детальный экран, в котором будут все картины автора.
 
 При нажатии на картину она увеличивается во всю ширину экрана(в нижнем правом углу появляется значок). Над картиной отображаем название, под - описание.
 
 Реализовать поиск по названию картины или автора.
 */

import UIKit

// MARK: - Variables

private let artists: [Artist] = ArtistData.getMockArray()

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private let searchField: UISearchTextField = {
        let search = UISearchTextField()
        
        return search
    }()
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //        layout.minimumLineSpacing = 32
        //        layout.minimumInteritemSpacing = 32
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        return layout
    }()
    
    private lazy var collectionArtists: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.alwaysBounceVertical = true
        collection.showsVerticalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    //    MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setDelegate()
        setConstraints()
    }
    
    
    //    MARK: Setup View
    
    private func setView() {
        view.backgroundColor = .white
        
        view.addSubview(searchField)
        view.addSubview(collectionArtists)
        
        collectionArtists.register(ArtistCell.self, forCellWithReuseIdentifier: ArtistCell.identifier)
    }
    
    private func setDelegate() {
        collectionArtists.delegate = self
        collectionArtists.dataSource = self
    }
    
}

// MARK: - Extensions Setup Constraints

extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionArtists.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionArtists.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionArtists.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionArtists.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: Extensions Collection View

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCell.identifier, for: indexPath) as? ArtistCell else { fatalError("Failed to dequeue ArtistsCell in VC")}
        
        let artist = artists[indexPath.row]
        cell.configureCell(artist: artist)
        
        return cell
    }
}

// MARK: - Extensions UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    //    размер контента
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
    //        let contentHorizontalSpaces = layout.minimumInteritemSpacing + layout.sectionInset.left + layout.sectionInset.right
    //
    //        let newCellWidth = (collectionView.bounds.width - contentHorizontalSpaces) / 2
    //
    //        let newHeight = ArtistCell.getProguctHieghtForWidth(artist: artists[indexPath.row], width: newCellWidth)
    //
    //        return CGSize(width: newCellWidth, height: newHeight)
    //    }
    
    
    //    вертикальный межстрочный интервал
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    //    горизонтальный интервал
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}


