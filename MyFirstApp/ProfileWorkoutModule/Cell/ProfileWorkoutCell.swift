//
//  ProfileWorkoutCell.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 23.03.2023.
//

import UIKit

class ProfileWorkoutCell: UICollectionViewCell {
    
    static let idProfileWorkoutCell = "idProfileWorkoutCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .specialDarkGreen
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameWorkoutLabel = UILabel(text: "BICEPS",
                                          font: .robotoMedium24(),
                                          textColor: .white)
    
    private let countWorkoutLabel = UILabel(text: "100",
                                            font: .robotoBold48(),
                                            textColor: .white)

     
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.layer.cornerRadius = 20
        self.backgroundColor = .specialGreen
        self.addSubview(nameWorkoutLabel)
        self.addSubview(countWorkoutLabel)
        self.addSubview(imageView)
    }
}

extension ProfileWorkoutCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameWorkoutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameWorkoutLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameWorkoutLabel.heightAnchor.constraint(equalToConstant: 30),
            
            imageView.topAnchor.constraint(equalTo: nameWorkoutLabel.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 59),
            imageView.heightAnchor.constraint(equalToConstant: 67),
            
            countWorkoutLabel.topAnchor.constraint(equalTo: nameWorkoutLabel.bottomAnchor, constant: 3),
            countWorkoutLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            countWorkoutLabel.widthAnchor.constraint(equalToConstant: 82),
            countWorkoutLabel.heightAnchor.constraint(equalToConstant: 56) 
        ])
    }
}
