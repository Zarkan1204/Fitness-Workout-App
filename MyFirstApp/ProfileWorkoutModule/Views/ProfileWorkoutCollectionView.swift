//
//  ProfileWorkoutCollectionView.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 23.03.2023.
//

import UIKit

class ProfileWorkoutCollectionView: UICollectionView {
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        register(ProfileWorkoutCell.self, forCellWithReuseIdentifier: ProfileWorkoutCell.idProfileWorkoutCell)
        delegate = self
        dataSource = self
        configure()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private  func configure() {
        self.backgroundColor = .specialBackground
        self.translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
    }
    
    private func setupLayout() {
        collectionLayout.scrollDirection = .horizontal
    }
    
}

extension ProfileWorkoutCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileWorkoutCell.idProfileWorkoutCell, for: indexPath) as? ProfileWorkoutCell else { return ProfileWorkoutCell()}
                return cell
    }
}

extension ProfileWorkoutCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width * 0.48, height: 110)
    }
}
