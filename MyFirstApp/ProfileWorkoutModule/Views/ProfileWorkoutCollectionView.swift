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
        collectionLayout.minimumInteritemSpacing = 5
    }
}

extension ProfileWorkoutCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileWorkoutCell.idProfileWorkoutCell, for: indexPath) as? ProfileWorkoutCell else { return ProfileWorkoutCell()}
        cell.backgroundColor = (indexPath.row % 4 == 0 || indexPath.row % 4 == 3 ? .specialGreen : .specialDarkYellow)
                return cell
    }
}

extension ProfileWorkoutCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2.07, height: 120)
    }
}
