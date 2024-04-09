//
//  IPXPhotoExplorerViewController.swift
//  iPics
//
//  Created by Saulo Freire on 25/03/24.
//

import UIKit

class IPXPhotoExplorerViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        return IPXPhotoGridFactory().makeCollectionView(frame: view.bounds)
    }()
    
    lazy var dataSource: IPXPhotoGridDataSource = {
        return IPXPhotoGridFactory().makeDataSource(for: collectionView)
    }()
    
    var interactor: IPXPhotoExplorerInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        collectionView.dataSource = dataSource
        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        constraints.ipx.activate()
        
        interactor?.getPictures()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
