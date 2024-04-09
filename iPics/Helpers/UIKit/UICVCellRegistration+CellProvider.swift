//
//  UICVCellRegistration+CellProvider.swift
//  iPics
//
//  Created by Saulo Freire on 25/03/24.
//

import Foundation
import UIKit

extension UICollectionView.CellRegistration {
    var cellProvider: (UICollectionView, IndexPath, Item) -> Cell {
        return { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(
                using: self,
                for: indexPath,
                item: item
            )
        }
    }
}
