//
//  IPXPhotoGridLayout.swift
//  iPics
//
//  Created by Saulo Freire on 27/03/24.
//

import UIKit

enum IPXLayoutSegments {
    case fullWidth
    case fiftyFifty
    case twoThirdsOneThird
    case oneThirdTwoThirds
}

class IPXPhotoGridLayout: UICollectionViewLayout {
    
    var contentBounds = CGRect.zero
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView,
        collectionView.numberOfSections > 0 else { return }
        
        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: collectionView.bounds.size)
        
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        
        var currentIndex = 0
        var segment: IPXLayoutSegments = .fullWidth
        var lastFrame: CGRect = .zero
        
        let collectionViewWidth = collectionView.bounds.size.width
        
        while currentIndex < itemsCount {
            let currentSegmentFrame = CGRect(x: 0, y: lastFrame.maxY, width: collectionViewWidth, height: 200.0)
            var currentSegmentRects = [CGRect]()
            
            switch segment {
            case .fullWidth:
                currentSegmentRects = [currentSegmentFrame]
            case .fiftyFifty:
                let horizontalSlices = currentSegmentFrame.ipx.dividedIntegral(fraction: 0.5, from: .minXEdge)
                currentSegmentRects = [horizontalSlices.first, horizontalSlices.second]
            case .twoThirdsOneThird:
                let horizontalSlices = currentSegmentFrame.ipx.dividedIntegral(fraction: (2.0 / 3.0), from: .minXEdge)
                let verticalSlices = horizontalSlices.second.ipx.dividedIntegral(fraction: 0.5, from: .minYEdge)
                currentSegmentRects = [horizontalSlices.first, verticalSlices.first, verticalSlices.second]
            case .oneThirdTwoThirds:
                let horizontalSlices = currentSegmentFrame.ipx.dividedIntegral(fraction: (1.0 / 3.0), from: .minXEdge)
                let verticalSlices = horizontalSlices.first.ipx.dividedIntegral(fraction: 0.5, from: .minYEdge)
                currentSegmentRects = [verticalSlices.first, verticalSlices.second, horizontalSlices.second]
            }
            
            for rect in currentSegmentRects {
                let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentIndex, section: 0))
                layoutAttributes.frame = rect
                
                cachedAttributes.append(layoutAttributes)
                contentBounds = contentBounds.union(lastFrame)
                
                currentIndex += 1
                lastFrame = rect
            }
            
            switch itemsCount - currentIndex {
            case 1:
                segment = .fullWidth
            case 2:
                segment = .fiftyFifty
            default:
                switch segment {
                case .fullWidth:
                    segment = .fiftyFifty
                case .fiftyFifty:
                    segment = .twoThirdsOneThird
                case .twoThirdsOneThird:
                    segment = .oneThirdTwoThirds
                case .oneThirdTwoThirds:
                    segment = .fiftyFifty
                }
            }
            
        }
        
    }
    
    override var collectionViewContentSize: CGSize {
        return contentBounds.size
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return !newBounds.size.equalTo(collectionView.bounds.size)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath.item]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        guard let lastIndex = cachedAttributes.indices.last,
              let firstMatchIndex = attributesBinarySearch(rect, start: 0, end: lastIndex)
        else {
            return attributesArray
        }
        
        for attributes in cachedAttributes[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxY >= rect.minY else { break }
            attributesArray.append(attributes)
        }
        
        for attributes in cachedAttributes[firstMatchIndex...] {
            guard attributes.frame.minY <= rect.maxY else { break }
            attributesArray.append(attributes)
        }
        
        return attributesArray
        
    }
    
    func attributesBinarySearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
        if end < start { return nil }
        
        let mid = (start + end) / 2
        
        let attribute = cachedAttributes[mid]
        
        if attribute.frame.intersects(rect) {
            return mid
        } else {
            if attribute.frame.maxY < rect.minY {
                return attributesBinarySearch(rect, start: (mid + 1), end: end)
            } else {
                return attributesBinarySearch(rect, start: start, end: (end - 1))
            }
        }
    }
    
}
