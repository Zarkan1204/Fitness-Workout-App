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
    
    // таймер во время тренировки показывает минут и секунды
    func convertSeconds() -> (Int, Int) {
        let min = self / 60
        let sec = self % 60
        return (min, sec)
    }
    // если число меньше 10 то пишем впереди "0" например "09"
    func setZeroForSecond() -> String {
        Double(self) / 10.0 < 1 ? "0\(self)" : "\(self)"
    }
}
