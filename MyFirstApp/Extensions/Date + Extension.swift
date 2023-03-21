//
//  Date + Extension.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 06.03.2023.
//

import Foundation

extension Date {
    //стучимся до дня недели
    func getWeekdayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
    
    // формат даты
    func localDate() -> Date {
        let timeZoneOfset = Double(TimeZone.current.secondsFromGMT(for: self))
        let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOfset), to: self) ?? Date()
        return localDate
    }
    func getWeekArray() -> [[String]] {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "EEEEEE"
        let calendar = Calendar.current
        
        var weekArray: [[String]] = [[], []]
        
        for index in -6...0 {
            let date = calendar.date(byAdding: .day, value: index, to: self) ?? Date()
            let day = calendar.component(.day, from: date)
            weekArray[1].append("\(day)")
            let weekDay = formatter.string(from: date)
            weekArray[0].append(weekDay)
        }
        return weekArray
    }
    
    // метод позволяет нам смещаться на день назад
    func offsetDay(day: Int) -> Date {
        let offsetDay = Calendar.current.date(byAdding: .day, value: -day, to: self) ?? Date()
        return offsetDay
    }
    
    // метод позволяет нам смещаться на месяц назад
    func offsetMonth(month: Int) -> Date {
        let offsetDate = Calendar.current.date(byAdding: .month, value: -month, to: self) ?? Date()
        return offsetDate
    }
    
    
    // получаем дату и время 00:00 (ищем запись между начальной и конечно датой)
    func startEndDate() -> (start: Date, end: Date) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let calendar  = Calendar.current

        let stringDate = formatter.string(from: self)
        let totalData = formatter.date(from: stringDate) ?? Date()
        
        let local = totalData.localDate()
        let dateEnd: Date = {
            let components = DateComponents(day: 1)
            return calendar.date(byAdding: components, to: local) ?? Date()
        }()
        return (local, dateEnd)
    }
}
