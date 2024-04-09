//
//  Array+NSLayoutConstraints.swift
//  iPics
//
//  Created by Saulo Freire on 23/03/24.
//

import Foundation
import UIKit


extension Array: IPXCompatible {}

extension IPXWrapper where Wrapped == [NSLayoutConstraint] {
    func activate() {
        for constraint in self.wrapped {
            if constraint.isActive { continue }
            constraint.isActive = true
        }
    }
    func deactivate() {
        for constraint in self.wrapped {
            if !constraint.isActive { continue }
            constraint.isActive = false
        }
    }
}
