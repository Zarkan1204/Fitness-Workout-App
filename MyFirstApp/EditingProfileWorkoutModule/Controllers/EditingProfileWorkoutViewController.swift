//
//  EditingProfileWorkoutViewController.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 22.03.2023.
//

import UIKit

class EditingProfileWorkoutViewController: UIViewController {
     
    private let editingProfileLabel = UILabel(text: "EDITING PROFILE",
                                          font: .robotoMedium24(),
                                          textColor: .specialGray)

    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let greenBackgroundProfileView = GreenBackgroundProfileView()
    
    private let firstNameLabel = UILabel(text: "First name")
    public let firstNameTextField = BrownTextField()
    
    private let secondNameLabel = UILabel(text: "Second name")
    public let secondNameTextField = BrownTextField()
    
    private let weightLabel = UILabel(text: "Weight")
    public let weightNameTextField = BrownTextField()
    
    private let heightLabel = UILabel(text: "Height")
    public let heightNameTextField = BrownTextField()
    
    private lazy var saveButton = GreenButton(text: "SAVE")

    override func viewDidLayoutSubviews() {
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(editingProfileLabel)
        view.addSubview(greenBackgroundProfileView)
        view.addSubview(profilePhotoImageView)
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(secondNameLabel)
        view.addSubview(secondNameTextField)
        view.addSubview(weightLabel)
        view.addSubview(weightNameTextField)
        view.addSubview(heightLabel)
        view.addSubview(heightNameTextField)
        view.addSubview(saveButton)
    }
    
    @objc private func saveButtonTapped() {
        print("save")
    }
}

extension EditingProfileWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            editingProfileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            editingProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            profilePhotoImageView.topAnchor.constraint(equalTo: editingProfileLabel.bottomAnchor, constant: 10),
            profilePhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            profilePhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            greenBackgroundProfileView.topAnchor.constraint(equalTo: profilePhotoImageView.centerYAnchor),
            greenBackgroundProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            greenBackgroundProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            greenBackgroundProfileView.heightAnchor.constraint(equalToConstant: 70),
        
            firstNameLabel.topAnchor.constraint(equalTo: greenBackgroundProfileView.bottomAnchor, constant: 40),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 5),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            secondNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 20),
            secondNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            secondNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 5),
            secondNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            weightLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 20),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            weightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            weightNameTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 5),
            weightNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weightNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            heightLabel.topAnchor.constraint(equalTo: weightNameTextField.bottomAnchor, constant: 20),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            heightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            heightNameTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 5),
            heightNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heightNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            heightNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            saveButton.topAnchor.constraint(equalTo: heightNameTextField.bottomAnchor, constant: 50),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
