//
//  StatisticTableViewCell.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 27.02.2023.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    static let idStatisticTableViewCell = "StatisticTableViewCell"
    
    private let workoutNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Biceps"
        label.textColor = .specialBlack
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutBeforeLabel = UILabel(text: "Before: 10")
    private let workoutNowLabel = UILabel(text: "Now: 20")
    
    private var labelsStackView = UIStackView()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "+2"
        label.textAlignment = .right
        label.textColor = .specialGreen
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let customSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(workoutNameLabel)
        
        labelsStackView = UIStackView(arrangedSubviews: [workoutBeforeLabel, workoutNowLabel],
                                      axis: .horizontal,
                                      spacing: 10)
        addSubview(labelsStackView)
        addSubview(countLabel)
        addSubview(customSeparator)
    }
    
    public func configure(differenceWorkout: DifferenceWorkout) {
        workoutNameLabel.text = differenceWorkout.name
        workoutBeforeLabel.text = "Before: \(differenceWorkout.firstReps)"
        workoutNowLabel.text = "Now: \(differenceWorkout.lastReps)"
        
        let difference = differenceWorkout.lastReps - differenceWorkout.firstReps
        countLabel.text = "\(difference)"
        
        switch difference {
        case ..<0: countLabel.textColor = .specialGreen
        case 1...: countLabel.textColor = .specialYellow
        default:
            countLabel.textColor = .specialGray
        }
    }
}

extension StatisticTableViewCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            countLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            countLabel.widthAnchor.constraint(equalToConstant: 50),
            
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            workoutNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workoutNameLabel.trailingAnchor.constraint(equalTo: countLabel.leadingAnchor, constant: -20),
            
            labelsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 5),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            customSeparator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            customSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            customSeparator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            customSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

