//
//  TimerWorkoutViewController.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 17.03.2023.
//

import UIKit

class TimerWorkoutViewController: UIViewController {
   
    private let startWorkoutLabel = UILabel(text: "START WORKOUT",
                                          font: .robotoMedium24(),
                                          textColor: .specialGray)
    
    private lazy var closeButton = CloseButton(type: .system)
    
    private let ellipseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ellipse")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "1:35"
        label.textColor = .specialGray
        label.font = .robotoBold48()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ditailsLabel = UILabel(text: "Ditails")
    private let timerWorkoutParametersView = TimerWorkoutParametersView()
    private lazy var finishButton = GreenButton(text: "FINISH")
    
    private var workoutModel = WorkoutModel()
    private var customAlert = CustomAlert()
    private let shepeLayer = CAShapeLayer()
    private var timer = Timer()
    
    private var durationTimer = 10
    private var numberOfSet = 0
    
    override func viewDidLayoutSubviews() {
        animationCircular()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
        addTapped()
        setWorkoutParameters()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
       
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(ellipseImageView)
        view.addSubview(timerLabel)
        view.addSubview(ditailsLabel)
        timerWorkoutParametersView.refreshLabels(model: workoutModel, numberOfSet: numberOfSet)
        view.addSubview(timerWorkoutParametersView)
        timerWorkoutParametersView.cellNextSetTimerDelegate = self
        view.addSubview(finishButton)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func closeButtonTapped() {
        timer.invalidate()
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func finishButtonTapped() {
        if numberOfSet == workoutModel.workoutSets {
            dismiss(animated: true)
            RealmManager.shared.updateStatusWorkoutModule(model: workoutModel)
        } else {
            presentAlertWithAction(title: "Warning", message: "You haven't finished your workout") {
                self.dismiss(animated: true)
            }
        }
    }
    
    public func setWorkoutModel(_ model: WorkoutModel) {
        workoutModel = model
    }
    
    // нажатие на лейбл таймер
    private func addTapped() {
        let tapLabel = UITapGestureRecognizer(target: self, action: #selector(startTimer))
        timerLabel.isUserInteractionEnabled = true
        timerLabel.addGestureRecognizer(tapLabel)
    }
    
    // нажимаем на таймер и кнопки не доступны
    @objc private func startTimer() {
        timerWorkoutParametersView.buttonIsEnable(false)
        
        if numberOfSet == workoutModel.workoutSets {
            presentSimpleAlert(title: "Error", message: "Finish your workout!")
        } else {
            basicAnimation()
            timer = Timer.scheduledTimer(timeInterval: 1,
                          target: self,
                          selector: #selector(timerAction),
                          userInfo: nil,
                          repeats: true)
        }
    }
    
    @objc private func timerAction() {
        durationTimer -= 1
        
        if durationTimer == 0 {
            timer.invalidate()
            durationTimer = workoutModel.workoutTimer

            numberOfSet += 1
            timerWorkoutParametersView.refreshLabels(model: workoutModel, numberOfSet: numberOfSet)
            timerWorkoutParametersView.buttonIsEnable(true)
        }
        
        let (min, sec) = durationTimer.convertSeconds()
        timerLabel.text = "\(min):\(sec.setZeroForSecond())"
    }
    
   
    // сколько выставляем времени столько и на таймере
    private func setWorkoutParameters() {
        let (min, sec) = workoutModel.workoutTimer.convertSeconds()
        timerLabel.text = "\(min):\(sec.setZeroForSecond())"
        durationTimer = workoutModel.workoutTimer
    }
}

extension TimerWorkoutViewController: NextSetTimerProtocol {
    func nextSetTimerTapped() {
        if numberOfSet < workoutModel.workoutSets {
            numberOfSet += 1
            timerWorkoutParametersView.refreshLabels(model: workoutModel, numberOfSet: numberOfSet)
        } else {
            presentSimpleAlert(title: "Error", message: "Finish your workout!")
        }
    }
    
    func editingTapped() {
        customAlert.presentCustomAlert(viewController: self, repsOrTimer: "Timer of set") { [weak self] sets, timerOfSet in
            guard let self = self else { return }
            if sets != "" && timerOfSet != "" {
                guard let numberOfSets = Int(sets),
                      let numberOfTimer = Int(timerOfSet) else { return }
                RealmManager.shared.updateSetsTimerWorkoutModule(model: self.workoutModel,
                                                                 sets: numberOfSets,
                                                                 timer: numberOfTimer)
                let (min, sec) = numberOfTimer.convertSeconds()
                self.timerLabel.text = "\(min):\(sec.setZeroForSecond())"
                self.durationTimer = numberOfTimer
                self.timerWorkoutParametersView.refreshLabels(model: self.workoutModel, numberOfSet: self.numberOfSet)
            }
        }
    }  
}

// зеленый индикатор времени
extension TimerWorkoutViewController {
    
    private func animationCircular() {
       
        let center = CGPoint(x: ellipseImageView.frame.width / 2,
                             y: ellipseImageView.frame.height / 2)
        
        let endAngle = (-CGFloat.pi / 2)
        let startAngle = 2 * CGFloat.pi + endAngle
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 127, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        shepeLayer.path = circularPath.cgPath
        shepeLayer.lineWidth = 21
        shepeLayer.fillColor = UIColor.clear.cgColor
        shepeLayer.strokeColor = UIColor.specialGreen.cgColor
        shepeLayer.strokeEnd = 1
        shepeLayer.lineCap = .round
        ellipseImageView.layer.addSublayer(shepeLayer)
    }

    //настройка анимации индикатора таймера
    private func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(durationTimer)
        basicAnimation.isRemovedOnCompletion = true
        shepeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}


extension TimerWorkoutViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            
            ellipseImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 30),
            ellipseImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ellipseImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            ellipseImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            timerLabel.centerYAnchor.constraint(equalTo: ellipseImageView.centerYAnchor),
            timerLabel.leadingAnchor.constraint(equalTo: ellipseImageView.leadingAnchor, constant: 40),
            timerLabel.trailingAnchor.constraint(equalTo: ellipseImageView.trailingAnchor, constant: -40),
            
            ditailsLabel.topAnchor.constraint(equalTo: ellipseImageView.bottomAnchor, constant: 20),
            ditailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            ditailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            timerWorkoutParametersView.topAnchor.constraint(equalTo: ditailsLabel.bottomAnchor, constant: 5),
            timerWorkoutParametersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timerWorkoutParametersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timerWorkoutParametersView.heightAnchor.constraint(equalToConstant: 230),
            
            finishButton.topAnchor.constraint(equalTo: timerWorkoutParametersView.bottomAnchor, constant: 20),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

