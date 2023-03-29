//
//  WeatherView.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 21.02.2023.
//

import UIKit

class WeatherView: UIView {
    
    private let titleWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.textColor = .specialGray
        label.font = .robotoMedium14()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageWeather: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sun")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        layer.cornerRadius = 10
        addShadowOnView()
        translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleWeatherLabel)
        self.addSubview(descriptionWeatherLabel)
        self.addSubview(imageWeather)
    }
    
    public func updateImage(data: Data) {
        guard let image = UIImage(data: data) else { return }
        imageWeather.image = image
    }
    
    public func updateLabels(model: WeatherModel) {
        titleWeatherLabel.text = model.weather[0].myDescription + "  \(model.main.temperatureCelsius)°C"
        
        switch model.weather[0].weatherDescription {
        case "shower snow":
            descriptionWeatherLabel.text = "Лучше остаться дома и провести домашнюю тренировку"
        case "clear sky":
            descriptionWeatherLabel.text = "Прекрасная погода для тренировки на улице"
        case "few clouds":
            descriptionWeatherLabel.text = "На улице облачно"
        case "scattered clouds":
            descriptionWeatherLabel.text = "На улице облачно"
        case "broken clouds":
            descriptionWeatherLabel.text = "На улице облачно"
        case "shower rain":
            descriptionWeatherLabel.text = "Лучше остаться дома и провести домашнюю тренировку"
        case "rain":
            descriptionWeatherLabel.text = "Лучше остаться дома и провести домашнюю тренировку"
        case "thunderstorm":
            descriptionWeatherLabel.text = "Лучше остаться дома и провести домашнюю тренировку"
        case "snow":
            descriptionWeatherLabel.text = "Лучше остаться дома и провести домашнюю тренировку"
        case "mist":
            descriptionWeatherLabel.text = "На улице туман"
        case "overcast clouds":
            descriptionWeatherLabel.text = "На улице облачно"
        case "light shower snow":
            descriptionWeatherLabel.text = "Лучше остаться дома и провести домашнюю тренировку"
        default:
            descriptionWeatherLabel.text = "No data"
        }
    }
}
    
extension WeatherView {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            imageWeather.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageWeather.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageWeather.widthAnchor.constraint(equalToConstant: 60),
            imageWeather.heightAnchor.constraint(equalToConstant: 60),
            
            titleWeatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleWeatherLabel.trailingAnchor.constraint(equalTo: imageWeather.leadingAnchor, constant: -10),
            titleWeatherLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionWeatherLabel.topAnchor.constraint(equalTo: titleWeatherLabel.bottomAnchor, constant: 0),
            descriptionWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionWeatherLabel.trailingAnchor.constraint(equalTo: imageWeather.leadingAnchor, constant: -10),
            descriptionWeatherLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}

