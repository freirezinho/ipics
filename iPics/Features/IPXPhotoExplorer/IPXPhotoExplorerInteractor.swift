//
//  IPXPhotoExplorerInteractor.swift
//  iPics
//
//  Created by Saulo Freire on 27/03/24.
//

import Foundation

class IPXPhotoExplorerInteractor {
    
    var presenter: IPXPhotoExplorerPresenter?
    
    func getPictures() {
        PictureWorker().getPicture(completion: { imageList in
            var photoList = [IPXPhoto]()
            for image in imageList {
                photoList.append(IPXPhoto(image: image))
            }
            DispatchQueue.main.async { [weak self] in
                self?.presenter?.photosDidLoad(photoList)
            }
        })
    }
    
}
