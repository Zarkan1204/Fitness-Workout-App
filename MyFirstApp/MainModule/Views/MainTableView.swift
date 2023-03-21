//
//  MainTableView.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 26.02.2023.
//

import UIKit

protocol MainTableViewProtocol: AnyObject {
    func deleteWorkout( model: WorkoutModel, index: Int)
}

class MainTableView: UITableView {
    
    weak var mainDeligate: MainTableViewProtocol?
    
    private var workoutArray = [WorkoutModel]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configure()
        setDelegates()
        register(WorkoutTableViewCell.self, forCellReuseIdentifier: WorkoutTableViewCell.idTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func configure() {
        backgroundColor = .none
        separatorStyle = .none
        bounces = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func setDelegates() {
        delegate = self
        dataSource = self
    }
    
    public func setWorkoutArray(array: [WorkoutModel]) {
        workoutArray = array
    }
}


//MARK: - UITableViewDataSource

extension MainTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workoutArray.count //количество ячеек зависит от количества записей
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.idTableViewCell,
                                                       for: indexPath) as? WorkoutTableViewCell else {
            return UITableViewCell()
            
        }
        let workoutModel = workoutArray[indexPath.row] //передаем модель в ячейку по индексу
        cell.configure(model: workoutModel)
        cell.workoutCellDeligate = mainDeligate as? WorkoutCellProtocol
        return cell
    }
}

//MARK: - UITableViewDelegate

extension MainTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    //удаляет тренировку свайпом
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "") { [weak self] _, _, _ in
            guard let self = self else { return }
            let deleteModel = self.workoutArray[indexPath.row]
            self.mainDeligate?.deleteWorkout(model: deleteModel, index: indexPath.row) //получаем модель которую удаляем и передаем ее индекс
        }
        action.backgroundColor = .specialBackground
        action.image = UIImage(named: "delete")
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
