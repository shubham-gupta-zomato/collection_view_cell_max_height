//
//  ViewController.swift
//  Composition Layout
//
//  Created by Shubham Gupta on 19/07/22.
//

import UIKit

class ViewController: UIViewController {
    var dataSource: UICollectionViewDiffableDataSource<Int, Int>!
    var collectionView: UICollectionView!
    var layout: ZCollectionViewLayout!
    let itemsPerSection = 10
    var heightDimension: NSCollectionLayoutDimension = .estimated(100)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Collection View"
        configureHierarchy()
        configureDataSource()
    }
}

extension ViewController {
    func configureHierarchy() {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                                             heightDimension: heightDimension))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .fractionalHeight(1)),
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = .zero
        layout = ZCollectionViewLayout(section: section)

        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth,
                                           .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
}

extension ViewController {
    func configureDataSource() {
        let cellRegistration1 = UICollectionView.CellRegistration<ListCell, Int> { cell, indexPath, _ in
            cell.label.numberOfLines = indexPath.row
            cell.label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.cornerRadius = 8
        }

        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration1, for: indexPath, item: identifier)
        }

        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        var identifierOffset = 0
        snapshot.appendSections([1])
        let maxIdentifier = identifierOffset + itemsPerSection
        snapshot.appendItems(Array(identifierOffset ..< maxIdentifier))
        identifierOffset += itemsPerSection
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
