//
//  PictureWorker.swift
//  iPics
//
//  Created by Saulo Freire on 27/03/24.
//

import Foundation
import UIKit

class PictureWorker: NSObject {
    
    private lazy var urlSession = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
    
    func getPicture(completion: @escaping ([UIImage]) -> ()) {
        let pictures = [
            "https://digimon-api.com/images/digimon/w/Agumon.png",
            "https://digimon-api.com/images/digimon/w/Greymon.png",
            "https://digimon-api.com/images/digimon/w/Metal_Greymon(Alterous_Mode).png",
            "https://digimon-api.com/images/digimon/w/War_Greymon.png",
            "https://digimon-api.com/images/digimon/w/Omegamon.png",
            "https://digimon-api.com/images/digimon/w/Omegamon_(X-Antibody).png",
            "https://digimon-api.com/images/digimon/w/Omegamon(Merciful_Mode).png"
        ]
                
        var retrievedImages = [UIImage]()
        
        for pictureURLString in pictures {
            guard let pictureURL = URL(string: pictureURLString) else { continue }
            urlSession.dataTask(with: pictureURL) { (data, response, error) in
                guard let data = data,
                      error == nil,
                      let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                      let image = UIImage(data: data)
                else {
//                    completion(error)
                    return
                }
                retrievedImages.append(image)
                completion(
                    retrievedImages
                )
            }.resume()
        }
        completion(
            retrievedImages
        )
    }
}
