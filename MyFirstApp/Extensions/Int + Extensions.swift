//
//  Int + Extensions.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 06.03.2023.
//

import Foundation

//показывает таймер в минутах и секундах
extension Int {
    func getTimeFromSeconds() -> String {
        if self / 60 == 0 {
            return "\(self % 60) sec"
        }
        if self % 60 == 0 {
            return "\(self / 60) min"
        }
       return "\(self / 60) min \(self % 60) sec"
    }
}
