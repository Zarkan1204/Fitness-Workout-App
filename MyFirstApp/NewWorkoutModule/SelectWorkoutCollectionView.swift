//
//  SelectWorkoutCollectionView.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 14.03.2023.
//

import UIKit

protocol ImageWorkoutProtocol: AnyObject {
    func setImage(imageName: String)
}

class SelectWorkoutCollectionView: UICollectionView {
    
    weak var selectImageDelegate: ImageWorkoutProtocol?
    
    private var nameImage = "imageCell"
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    private var imageNames = ["imageCell", "imageCell1", "imageCell2", "imageCell3", "imageCell4"]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        register(SelectWorkoutCell.self, forCellWithReuseIdentifier: SelectWorkoutCell.idSelectWorkoutCell)
        configure()
        setupLayout()
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.backgroundColor = .specialBrown
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.showsHorizontalScrollIndicator = false
    
    }
    
    private func setupLayout() {
        collectionLayout.minimumLineSpacing = 5
        collectionLayout.scrollDirection = .horizontal
    }
    
    public func getImage() -> String {
        nameImage
    }
}

extension SelectWorkoutCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectWorkoutCell.idSelectWorkoutCell, for: indexPath) as? SelectWorkoutCell else
        { return UICollectionViewCell()}
        let nameImage = imageNames[indexPath.row]
        cell.configure(nameImage: nameImage)
        if indexPath.row == 0 {
            selectItem(at: [0, 0], animated: true, scrollPosition: .left)
        }
        
        return cell
    }
}

extension SelectWorkoutCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width:collectionView.frame.width / 3.5 , height: collectionView.frame.height / 1.2)
    }
}

extension SelectWorkoutCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nameImage = imageNames[indexPath.row]
        selectImageDelegate?.setImage(imageName: nameImage)
    }
}
