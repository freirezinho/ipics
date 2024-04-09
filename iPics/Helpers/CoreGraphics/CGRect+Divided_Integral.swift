//
//  CGRect+Divided_Integral.swift
//  iPics
//
//  Created by Saulo Freire on 27/03/24.
//

import Foundation

extension CGRect: IPXCompatible {}

extension IPXWrapper where Wrapped == CGRect {
    func dividedIntegral(fraction: CGFloat, from fromEdge: CGRectEdge) -> (first: CGRect, second: CGRect) {
        let dimension: CGFloat
        let wrappedCGRect = self.wrapped
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            dimension = wrappedCGRect.size.width
        case .minYEdge, .maxYEdge:
            dimension = wrappedCGRect.size.height
        }
        
        let distance = (dimension*fraction).rounded(.up)
        var slices = wrappedCGRect.divided(atDistance: distance, from: fromEdge)
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            slices.remainder.origin.x += 1
            slices.remainder.size.width -= 1
        case .minYEdge, .maxYEdge:
            slices.remainder.origin.y += 1
            slices.remainder.size.height -= 1
        }
        
        return (first: slices.slice, second: slices.remainder)
    }
}
