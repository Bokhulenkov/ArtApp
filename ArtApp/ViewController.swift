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

private var artistData: ArtistData!

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private let searchField: UISearchTextField = {
        let search = UISearchTextField()
        
        return search
    }()
    
    private lazy var collectionArtists: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
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
            collectionArtists.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionArtists.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width)
        return CGSize(width: size, height: size)
    }
    
//    вертикальный межстрочный интервал
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
//    горизонтальный интервал
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
