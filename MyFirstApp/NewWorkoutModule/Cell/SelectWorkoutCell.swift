//
//  SelectWorkoutCell.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 14.03.2023.
//

import UIKit

class SelectWorkoutCell: UICollectionViewCell {
    
    static let idSelectWorkoutCell = "idSelectWorkoutCell"
    
    private let imageBackground: UIView = {
       let imageBackground = UIView()
        imageBackground.backgroundColor = .specialBackground
        imageBackground.layer.cornerRadius = 15
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        return imageBackground
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .specialDarkGreen
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                imageBackground.backgroundColor = .specialGreen
                imageView.tintColor = .white
            } else {
                imageBackground.backgroundColor = .specialBackground
                imageView.tintColor = .specialDarkGreen
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.layer.cornerRadius = 15
        self.addSubview(imageBackground)
        imageBackground.addSubview(imageView)
    }
    
    public func configure(nameImage: String) {
        imageView.image = UIImage(named: nameImage)?.withRenderingMode(.alwaysTemplate)
    }
}

extension SelectWorkoutCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7.5),
            imageBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7.5),
            imageBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            imageView.centerXAnchor.constraint(equalTo: imageBackground.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageBackground.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 64),
            imageView.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
}
