//
//  ImageWorkoutView.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 16.03.2023.
//

import UIKit

class ImageWorkoutView: UIView {
    
    private let imageLabel = UILabel(text: "Select Image")
    private let selectWorkoutCollectionView = SelectWorkoutCollectionView()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupVeiws()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupVeiws() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageLabel)
        addSubview(selectWorkoutCollectionView)
    }
    public func setDelegate(delegate: ImageWorkoutProtocol) {
        selectWorkoutCollectionView.selectImageDelegate = delegate
    }
}
extension ImageWorkoutView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            imageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            imageLabel.heightAnchor.constraint(equalToConstant: 16),
            
            selectWorkoutCollectionView.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 3),
            selectWorkoutCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            selectWorkoutCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            selectWorkoutCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        
        
        ])
    }
}
