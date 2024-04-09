//
//  IPXPhotoExplorerPresenter.swift
//  iPics
//
//  Created by Saulo Freire on 27/03/24.
//

import Foundation
import UIKit

class IPXPhotoExplorerPresenter {
    weak var viewController: IPXPhotoExplorerViewController?
    
    func photosDidLoad(_ list: [IPXPhoto]) {
        var snapshot = NSDiffableDataSourceSnapshot<IPXPhotoGrid.Section, IPXPhoto>()
        snapshot.appendSections([IPXPhotoGrid.Section.photos])
        
        snapshot.appendItems(list, toSection: .photos)
        
        viewController?.dataSource.apply(snapshot)
    }
}
