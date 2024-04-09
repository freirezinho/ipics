//
//  ViewController.swift
//  iPics
//
//  Created by Saulo Freire on 23/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello People of The Earth"
        label.font = .boldSystemFont(ofSize: 14.0)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.addSubview(label)
        view.backgroundColor = .systemBackground
    }
    
    func setupConstraints() {
        var constraintArray = [NSLayoutConstraint]()
        label.translatesAutoresizingMaskIntoConstraints = false
        constraintArray.append(label.topAnchor.constraint(equalTo: view.topAnchor, constant: 32.0))
        constraintArray.append(label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0))
        constraintArray.append(label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16.0))
        constraintArray.ipx.activate()
    }
    
}
