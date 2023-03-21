//
//  CustomAlert.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 18.03.2023.
//

import UIKit


// всплывающее окно при нажатии editing
class CustomAlert {
    
    private let backgroundView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
        
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let scrollView = UIScrollView()
    
    private var mainView: UIView?
    
    private let setsTextField = BrownTextField()
    private let repsTextField = BrownTextField()
    
    private var buttonAction: ((String, String) -> Void)?
    
    //передаем значения с репс и сетс текстфилдов
    func presentCustomAlert(viewController: UIViewController,
                            repsOrTimer: String,
                            completion: @escaping(String, String) -> Void) {
        
        registerForKeyboardNotification()
        
        
        guard let parentView = viewController.view else {return}
        mainView = parentView
        
        scrollView.frame = parentView.frame
        parentView.addSubview(scrollView)
        
        backgroundView.frame = parentView.frame
        scrollView.addSubview(backgroundView)
        
        alertView.frame = CGRect(x: 40,
                                 y: -420,
                                 width: parentView.frame.width - 80,
                                 height: 420)
        
        scrollView.addSubview(alertView)
        
        
        // добавляем и размещаем картинку
        let sportsmanImageView = UIImageView(frame: CGRect(
            x: (alertView.frame.width - alertView.frame.height * 0.4) / 2,
            y: 30,
            width: alertView.frame.height * 0.4,
            height: alertView.frame.height * 0.4))
        
        sportsmanImageView.image = UIImage(named: "sportsmanAlert")
        sportsmanImageView.contentMode = .scaleAspectFit
        alertView.addSubview(sportsmanImageView)
        
        
        //добавляем и размещаем основной лейбл
        let editingLabel = UILabel(text: "Editing", font: .robotoMedium22(), textColor: .specialBlack)
        editingLabel.frame = CGRect(x: 10,
                                    y: alertView.frame.height * 0.4 + 50,
                                    width: alertView.frame.width - 20,
                                    height: 25)
        
        editingLabel.textAlignment = .center
        editingLabel.translatesAutoresizingMaskIntoConstraints = true
        alertView.addSubview(editingLabel)
        
        // добавляем и размещаем лейбл первого текстфилда
        let setslabel = UILabel(text: "Sets")
        setslabel.frame = CGRect(x: 30,
                                 y: editingLabel.frame.maxY + 10,
                                 width: alertView.frame.width - 60,
                                 height: 20)
        setslabel.translatesAutoresizingMaskIntoConstraints = true
        alertView.addSubview(setslabel)
        
        // добавляем и размещаем первый текстфилд
        setsTextField.frame = CGRect(x: 20,
                                     y: setslabel.frame.maxY,
                                     width: alertView.frame.width - 40,
                                     height: 30)
        setsTextField.translatesAutoresizingMaskIntoConstraints = true
        setsTextField.keyboardType = .numberPad
        alertView.addSubview(setsTextField)
        
        
        //так же деалем второй лейбл и текстфилд
        let repsOrtimerlabel = UILabel(text: repsOrTimer)
        repsOrtimerlabel.frame = CGRect(x: 30,
                                 y: setsTextField.frame.maxY + 3,
                                 width: alertView.frame.width - 60,
                                 height: 20)
        repsOrtimerlabel.translatesAutoresizingMaskIntoConstraints = true
        alertView.addSubview(repsOrtimerlabel)
        
        repsTextField.frame = CGRect(x: 20,
                                     y: repsOrtimerlabel.frame.maxY,
                                     width: alertView.frame.width - 40,
                                     height: 30)
        repsTextField.translatesAutoresizingMaskIntoConstraints = true
        repsTextField.keyboardType = .numberPad
        alertView.addSubview(repsTextField)
        
        
        let okButton = GreenButton(text: "OK")
        okButton.frame = CGRect(x: 50,
                                y: repsTextField.frame.maxY + 15,
                                width: alertView.frame.width - 100,
                                height: 35)
        okButton.translatesAutoresizingMaskIntoConstraints = true
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        alertView.addSubview(okButton)
        
        buttonAction = completion
        
        
        //анимация
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 0.8
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.alertView.center = parentView.center
                }
            }
        }
    }
    
    //собираем значения с текстфилдов
    @objc private func okButtonTapped() {
        
        guard let setNumber = setsTextField.text,
              let repsNumber = repsTextField.text else { return }
        
        buttonAction?(setNumber, repsNumber)
        
        
        guard let targetView = mainView else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.alertView.frame = CGRect(x: 40,
                                          y: targetView.frame.height,
                                          width: targetView.frame.width - 80,
                                          height: 420)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.backgroundView.alpha = 0
            }completion: { done in
                if done {
                    self.alertView.removeFromSuperview()
                    self.backgroundView.removeFromSuperview()
                    self.scrollView.removeFromSuperview()
                    self.setsTextField.text = ""
                    self.repsTextField.text = ""
                    self.removeForKeyboardNotification()
                }
            }
        }
    }
    
    //чтобы клавиатура не закрывала кнопку ОК когда записываем в текстфилд
    private func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kbWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kbWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeForKeyboardNotification() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    @objc private func kbWillShow() {
        scrollView.contentOffset = CGPoint(x: 0, y: 100)
    }
    
    @objc private func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
}
