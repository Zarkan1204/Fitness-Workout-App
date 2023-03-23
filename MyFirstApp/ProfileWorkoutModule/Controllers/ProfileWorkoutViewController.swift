//
//  ProfileWorkoutViewController.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 23.03.2023.
//

import UIKit

class ProfileWorkoutViewController: UIViewController {
    
    private let profileLabel = UILabel(text: "PROFILE",
                                          font: .robotoMedium24(),
                                          textColor: .specialGray)
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let greenBackProfileView = GreenBackProfileView()
    
    private let heightLabel = UILabel(text: "Height: 100",
                                          font: .robotoMedium16(),
                                          textColor: .specialBlack)

    private let weightLabel = UILabel(text: "Weight: 50",
                                          font: .robotoMedium16(),
                                          textColor: .specialBlack)
    
    private lazy var editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Editing", for: .normal)
        button.titleLabel?.font = .robotoMedium16()
        button.setImage(UIImage(named: "profileEditing")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.tintColor = .specialGreen
        button.semanticContentAttribute = .forceRightToLeft // меняет картинку с текстом местами
        button.addTarget(self, action: #selector(editingButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let profileWorkoutCollectionView = ProfileWorkoutCollectionView()

    private let targetLabel = UILabel(text: "TARGET: 20 Workouts",
                                      font: .robotoMedium16(),
                                      textColor: .specialBlack)
    
    private let minCountLabel = UILabel(text: "2",
                                          font: .robotoBold24(),
                                          textColor: .specialBlack)
    
    private let maxCountLabel = UILabel(text: "20",
                                          font: .robotoBold24(),
                                          textColor: .specialBlack)
    
    private var countStackView = UIStackView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
    }
    
    private func setupView() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(profileLabel)
        view.addSubview(greenBackProfileView)
        view.addSubview(photoImageView)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(editingButton)
        view.addSubview(profileWorkoutCollectionView)
        view.addSubview(targetLabel)
        countStackView = UIStackView(arrangedSubviews: [minCountLabel, maxCountLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        view.addSubview(countStackView)
    }
    
    @objc private func editingButtonTap() {
        let editingProfileWorkoutViewController = EditingProfileWorkoutViewController()
        editingProfileWorkoutViewController.modalPresentationStyle = .fullScreen
        present(editingProfileWorkoutViewController, animated: true)
    }
}

extension ProfileWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            photoImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 10),
            photoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),
            photoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            greenBackProfileView.topAnchor.constraint(equalTo: photoImageView.centerYAnchor),
            greenBackProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            greenBackProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            greenBackProfileView.heightAnchor.constraint(equalToConstant: 115),
            
            heightLabel.topAnchor.constraint(equalTo: greenBackProfileView.bottomAnchor, constant: 5),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            heightLabel.widthAnchor.constraint(equalToConstant: 80),
            heightLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weightLabel.topAnchor.constraint(equalTo: greenBackProfileView.bottomAnchor, constant: 5),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            weightLabel.widthAnchor.constraint(equalToConstant: 80),
            weightLabel.heightAnchor.constraint(equalToConstant: 20),
            
            editingButton.topAnchor.constraint(equalTo: greenBackProfileView.bottomAnchor, constant: 5),
            editingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            editingButton.widthAnchor.constraint(equalToConstant: 80),
            editingButton.heightAnchor.constraint(equalToConstant: 20),
            
            profileWorkoutCollectionView.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 25),
            profileWorkoutCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            profileWorkoutCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            profileWorkoutCollectionView.heightAnchor.constraint(equalToConstant: 230),
            
            targetLabel.topAnchor.constraint(equalTo: profileWorkoutCollectionView.bottomAnchor, constant: 25),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            targetLabel.widthAnchor.constraint(equalToConstant: 200),
            targetLabel.heightAnchor.constraint(equalToConstant: 20),
            
            countStackView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 25),
            countStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            countStackView.heightAnchor.constraint(equalToConstant: 25)  
        ])
    }
}
