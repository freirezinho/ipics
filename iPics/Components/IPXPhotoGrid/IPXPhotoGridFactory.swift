//
//  IPXPhotoGridFactory.swift
//  iPics
//
//  Created by Saulo Freire on 27/03/24.
//

import Foundation
import UIKit

class IPXPhotoGridFactory {
    func makeCollectionView(frame: CGRect) -> UICollectionView {
        let collectionView = IPXPhotoGrid(frame: frame)
        collectionView.register(IPXPhotoGridCell.self, forCellWithReuseIdentifier: IPXPhotoGridCell.identifier)
        return collectionView
    }
    
    func makeDataSource(for collectionView: UICollectionView) -> IPXPhotoGridDataSource {
        UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: makeCollectionViewCell().cellProvider)
    }
}

extension IPXPhotoGridFactory {
    typealias Cell = IPXPhotoGridCell
    typealias CellRegistration = UICollectionView.CellRegistration<Cell, IPXPhoto>
    
    func makeCollectionViewCell() -> CellRegistration {
        CellRegistration { cell, indexPath, photo in
            cell.imageView.image = photo.image
        }
    }
}
