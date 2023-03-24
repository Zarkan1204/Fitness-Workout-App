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
    
    private lazy var closeButton = CloseButton(type: .system)
    
    private let addPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.image = UIImage(named: "addPhoto")
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addPhotoView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialGreen
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let firstNameLabel = UILabel(text: "First name")
    public let firstNameTextField = BrownTextField()
    
    private let secondNameLabel = UILabel(text: "Second name")
    public let secondNameTextField = BrownTextField()
    
    private let weightLabel = UILabel(text: "Weight")
    public let weightNameTextField = BrownTextField()
    
    private let heightLabel = UILabel(text: "Height")
    public let heightNameTextField = BrownTextField()
    
    private let targetLabel = UILabel(text: "Target")
    private let targetTextField = BrownTextField()
    
    private lazy var saveButton = GreenButton(text: "SAVE")

    override func viewDidLayoutSubviews() {
        addPhotoImageView.layer.cornerRadius = addPhotoImageView.frame.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(editingProfileLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(addPhotoView)
        view.addSubview(addPhotoImageView)
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(secondNameLabel)
        view.addSubview(secondNameTextField)
        view.addSubview(weightLabel)
        view.addSubview(weightNameTextField)
        view.addSubview(heightLabel)
        view.addSubview(heightNameTextField)
        view.addSubview(targetLabel)
        view.addSubview(targetTextField)
        view.addSubview(saveButton)
    }
    
    @objc private func saveButtonTapped() {
        print("save")
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}

extension EditingProfileWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            editingProfileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            editingProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: editingProfileLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
        
            addPhotoImageView.topAnchor.constraint(equalTo: editingProfileLabel.bottomAnchor, constant: 20),
            addPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            addPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
  
            addPhotoView.topAnchor.constraint(equalTo: addPhotoImageView.topAnchor, constant: 50),
            addPhotoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addPhotoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addPhotoView.heightAnchor.constraint(equalToConstant: 70),
        
            firstNameLabel.topAnchor.constraint(equalTo: addPhotoView.bottomAnchor, constant: 40),
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
            
            targetLabel.topAnchor.constraint(equalTo: heightNameTextField.bottomAnchor, constant: 20),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            targetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            targetTextField.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 5),
            targetTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            targetTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            targetTextField.heightAnchor.constraint(equalToConstant: 40),
            
            saveButton.topAnchor.constraint(equalTo: targetTextField.bottomAnchor, constant: 50),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
