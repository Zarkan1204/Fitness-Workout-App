//
//  BrownTextField.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 03.03.2023.
//

import UIKit

class BrownTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self // делегат который убирает клавиатуру кнопкокй "Done"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .specialBrown
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = .specialGray
        font = .robotoBold20()
        leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 15,
                                                  height: 0))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// протокол убирания клавиатуры по нажатию на "Done"
extension BrownTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
    }
    
}
