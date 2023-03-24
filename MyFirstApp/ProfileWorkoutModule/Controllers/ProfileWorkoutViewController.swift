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
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userPhotoView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialGreen
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let userNameLabel = UILabel(text: "ARTEM GERASIMOV", font: .robotoMedium24(), textColor: .white)
    
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
    
    private let targetView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .specialBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .specialBrown
        progressView.progressTintColor = .specialGreen
        progressView.layer.cornerRadius = 14
        progressView.clipsToBounds = true
        progressView.setProgress(0, animated: false)
        progressView.layer.sublayers?[1].cornerRadius = 14
        progressView.subviews[1].clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        progressView.setProgress(0.6, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.height / 2
    }
    
    private func setupView() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(profileLabel)
        view.addSubview(userPhotoView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(editingButton)
        view.addSubview(profileWorkoutCollectionView)
        view.addSubview(targetLabel)
        countStackView = UIStackView(arrangedSubviews: [minCountLabel, maxCountLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        view.addSubview(countStackView)
        view.addSubview(targetView)
        view.addSubview(progressView)
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
            
            userPhotoImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20),
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 90),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 90),
   
            userPhotoView.topAnchor.constraint(equalTo: userPhotoImageView.topAnchor, constant: 45),
            userPhotoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userPhotoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userPhotoView.heightAnchor.constraint(equalToConstant: 110),
            
            userNameLabel.bottomAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: -20),
            userNameLabel.centerXAnchor.constraint(equalTo: userPhotoView.centerXAnchor),
            
            heightLabel.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 5),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            heightLabel.widthAnchor.constraint(equalToConstant: 80),
            heightLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weightLabel.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 5),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            weightLabel.widthAnchor.constraint(equalToConstant: 80),
            weightLabel.heightAnchor.constraint(equalToConstant: 20),
            
            editingButton.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 5),
            editingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            editingButton.heightAnchor.constraint(equalToConstant: 25),
            editingButton.widthAnchor.constraint(equalToConstant: 75),
            
            profileWorkoutCollectionView.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 20),
            profileWorkoutCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileWorkoutCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            profileWorkoutCollectionView.heightAnchor.constraint(equalToConstant: 250),
            
            targetLabel.topAnchor.constraint(equalTo: profileWorkoutCollectionView.bottomAnchor, constant: 25),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            targetLabel.widthAnchor.constraint(equalToConstant: 200),
            targetLabel.heightAnchor.constraint(equalToConstant: 20),
            
            countStackView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 25),
            countStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            countStackView.heightAnchor.constraint(equalToConstant: 25),
                        
            targetView.topAnchor.constraint(equalTo: countStackView.bottomAnchor, constant: 3),
            targetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            targetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            targetView.heightAnchor.constraint(equalToConstant: 28),

            progressView.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 20),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
}
