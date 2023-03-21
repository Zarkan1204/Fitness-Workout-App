//
//  RealmManager.swift
//  MyFirstApp
//
//  Created by Мой Macbook on 06.03.2023.
//

import RealmSwift

//работаем через синглтон
class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    
    //метод выдает все записи из базы данных
    func getResultWorkoutModel() -> Results<WorkoutModel> {
        realm.objects(WorkoutModel.self)
    }
    
    //метод сохраняет тренировку в БД
    func saveWorkoutModel(_ model: WorkoutModel) {
        try! realm.write {
            realm.add(model)
        }
    }
    //метод удаляет тренировку из БД
    func deleteWorkoutModel(_ model: WorkoutModel) {
        try! realm.write {
            realm.delete(model)
        }
    }
    
    //обновляем значения сетс и репс в алерте всплывающем
    func updateSetsRepsWorkoutModule(model: WorkoutModel, sets: Int, reps: Int) {
        try! realm.write {
            model.workoutSets = sets
            model.workoutReps = reps
        }
    }
    
    // тренировку завершаем 
    func updateStatusWorkoutModule(model: WorkoutModel) {
            try! realm.write {
                model.workoutStatus = true
        }
    }
}

