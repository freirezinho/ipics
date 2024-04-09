//
//  IPXPhotoGrid.swift
//  iPics
//
//  Created by Saulo Freire on 23/03/24.
//

import UIKit

typealias IPXPhotoGridDataSource = UICollectionViewDiffableDataSource<IPXPhotoGrid.Section, IPXPhoto>

class IPXPhotoGrid: UICollectionView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    convenience init(frame: CGRect) {
        self.init(frame: frame, collectionViewLayout: IPXPhotoGridLayout())
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.alwaysBounceVertical = true
        self.indicatorStyle = .default
    }
    
    enum Section: Int, CaseIterable {
        case photos
    }

}
 
                                                                                                                                                                                                                                                                                                                                                                                                                                            
