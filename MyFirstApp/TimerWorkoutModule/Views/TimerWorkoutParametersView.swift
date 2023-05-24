//
//  TimerWorkoutParametersView.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 17.03.2023.
//

import UIKit

protocol NextSetTimerProtocol: AnyObject {
    func nextSetTimerTapped()
    func editingTapped()
}

class TimerWorkoutParametersView: UIView {
    
    weak var cellNextSetTimerDelegate: NextSetTimerProtocol?
    
    private let workoutNameLabel = UILabel(text: "Squats", font: .robotoMedium24(), textColor: .specialGray)
    
    private let setsLabel = UILabel(text: "Sets", font: .robotoMedium18(), textColor: .specialGray)
    private let numberOfSetsLabel = UILabel(text: "1/4", font: .robotoMedium24(), textColor: .specialGray)
    private var setsStackView = UIStackView()
    
    private let setsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timerLabel = UILabel(text: "Time of set", font: .robotoMedium18(), textColor: .specialGray)
    private let numberOfTimerLabel = UILabel(text: "1 min 30 sec", font: .robotoMedium24(), textColor: .specialGray)
    private var timerStackView = UIStackView()
    
    private let timerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Editing", for: .normal)
        button.titleLabel?.font = .robotoMedium16()
        button.setImage(UIImage(named: "editing")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.tintColor = .specialLightBrown
        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT SET", for: .normal)
        button.backgroundColor = .specialYellow
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .specialGray
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        numberOfTimerLabel.textAlignment = .right
        addSubview(workoutNameLabel)
        setsStackView = UIStackView(arrangedSubviews: [setsLabel, numberOfSetsLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        setsStackView.distribution = .equalSpacing
        addSubview(setsStackView)
        addSubview(setsLineView)
        timerStackView = UIStackView(arrangedSubviews: [timerLabel, numberOfTimerLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        timerStackView.distribution = .equalSpacing
        addSubview(timerStackView)
        addSubview(timerLineView)
        addSubview(editingButton)
        addSubview(nextButton)
    }
    
    @objc private func editingButtonTapped() {
        cellNextSetTimerDelegate?.editingTapped()
    }
    
    @objc private func nextButtonTapped() {
        cellNextSetTimerDelegate?.nextSetTimerTapped()
    }
    
    public func refreshLabels(model: WorkoutModel, numberOfSet: Int) {
        workoutNameLabel.text = model.workoutName
        numberOfSetsLabel.text = "\(numberOfSet)/\(model.workoutSets)"
        numberOfTimerLabel.text = "\(model.workoutTimer.getTimeFromSeconds())"
    }
    
    public func buttonIsEnable(_ value: Bool) {
        editingButton.isEnabled = value
        nextButton.isEnabled = value
    }
}

extension TimerWorkoutParametersView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            setsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 10),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            setsStackView.heightAnchor.constraint(equalToConstant: 25),
            
            setsLineView.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 2),
            setsLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            setsLineView.heightAnchor.constraint(equalToConstant: 1),
            
            timerStackView.topAnchor.constraint(equalTo: setsLineView.bottomAnchor, constant: 20),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timerStackView.heightAnchor.constraint(equalToConstant: 25),
            
            timerLineView.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 2),
            timerLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timerLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timerLineView.heightAnchor.constraint(equalToConstant: 1),
            
            editingButton.topAnchor.constraint(equalTo: timerLineView.bottomAnchor, constant: 10),
            editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            editingButton.widthAnchor.constraint(equalToConstant: 80),
            editingButton.heightAnchor.constraint(equalToConstant: 20),
            
            nextButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 10),
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

