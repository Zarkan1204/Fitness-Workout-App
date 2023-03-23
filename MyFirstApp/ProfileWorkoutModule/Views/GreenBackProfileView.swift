//
//  GreenBackProfileView.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 23.03.2023.
//

import UIKit

class GreenBackProfileView: UIView {
    
    private let nameLabel = UILabel(text: "ARTEM GERASIMOV", font: .robotoMedium24(), textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
    }
}

extension GreenBackProfileView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)   
        ])
    }
}
