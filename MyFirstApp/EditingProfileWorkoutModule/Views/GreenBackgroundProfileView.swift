//
//  GreenBackgroundProfileView.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 22.03.2023.
//

import UIKit

class GreenBackgroundProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
