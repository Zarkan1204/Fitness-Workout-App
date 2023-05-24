//
//  NewWorkoutViewController.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 28.02.2023.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .none
        scrollView.bounces = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let newWorkoutLabel = UILabel(text: "NEW WORKOUT",
                                          font: .robotoMedium24(),
                                          textColor: .specialGray)
    
    private lazy var closeButton = CloseButton(type: .system)
    
    private let nameView = NameView()
    private let imageWorkoutView = ImageWorkoutView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    private lazy var saveButton = GreenButton(text: "SAVE")
    private var imageName = "imageCell"
    
    private var stackView = UIStackView()
    
    private var workoutModel  = WorkoutModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        addGesture()
    }
    
    private func setupView() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(newWorkoutLabel)
        contentView.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        contentView.addSubview(saveButton)
        imageWorkoutView.setDelegate(delegate: self)
        stackView = UIStackView(arrangedSubviews: [nameView,
                                                   imageWorkoutView,
                                                   dateAndRepeatView,
                                                   repsOrTimerView],
                                axis: .vertical,
                                spacing: 20)
        contentView.addSubview(stackView)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    
    @objc private func saveButtonTapped() {
        setModel()
        saveModel()
    }
    
    private func setModel() {
        workoutModel.workoutName = nameView.getNameTextFieldText()
        
        workoutModel.workoutDate = dateAndRepeatView.getDateAndRepeat().date
        workoutModel.workoutRepeat = dateAndRepeatView.getDateAndRepeat().isRepeat
        workoutModel.workoutNumberOfDay = dateAndRepeatView.getDateAndRepeat().date.getWeekdayNumber()
        
        workoutModel.workoutSets = repsOrTimerView.sets
        workoutModel.workoutReps = repsOrTimerView.reps
        workoutModel.workoutTimer = repsOrTimerView.timer
        
        workoutModel.workoutImage = imageName
    }
    
    private func saveModel() {
        let text = nameView.getNameTextFieldText()
        let count = text.filter{$0.isNumber || $0.isLetter}.count
        if count != 0 &&
            workoutModel.workoutSets != 0 &&
            (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            RealmManager.shared.saveWorkoutModel(workoutModel)
            createNotification()
            presentSimpleAlert(title: "Success", message: nil)
            workoutModel = WorkoutModel()
            resetValues()
        } else {
            presentSimpleAlert(title: "Error", message: "Enter all parameters")
        }
    }
    
    private func resetValues() {
        nameView.deleteTextFieldText()
        dateAndRepeatView.resetDataAndRepeat()
        repsOrTimerView.resetSliderViewValue()
    }
    
    private func addGesture() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
        
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    private func createNotification() {
        let notification = Notifications()
        let stringDate = workoutModel.workoutDate.yyyyMMddFromDate()
        notification.sheduleDateNotification(date: workoutModel.workoutDate, id: "workout" + stringDate)
    }
}

extension NewWorkoutViewController: ImageWorkoutProtocol {
    func setImage(imageName: String) {
        self.imageName = imageName
    }
}

extension NewWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            newWorkoutLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            nameView.heightAnchor.constraint(equalToConstant: 60),
            imageWorkoutView.heightAnchor.constraint(equalToConstant: 100),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 115),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 340),
            
            stackView.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55),
            saveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
