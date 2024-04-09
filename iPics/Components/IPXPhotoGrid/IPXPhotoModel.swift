//
//  IPXPhotoModel.swift
//  iPics
//
//  Created by Saulo Freire on 27/03/24.
//

import Foundation
import UIKit

struct IPXPhoto: Identifiable, Hashable {
    let id: UUID = UUID()
    let image: UIImage
}
