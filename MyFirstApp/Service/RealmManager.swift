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
    
    //обновляем значения сетс и таймер в алерте всплывающем
    func updateSetsTimerWorkoutModule(model: WorkoutModel, sets: Int, timer: Int) {
        try! realm.write {
            model.workoutSets = sets
            model.workoutTimer = timer
        }
    }
    
    // тренировку завершаем 
    func updateStatusWorkoutModule(model: WorkoutModel) {
        try! realm.write {
            model.workoutStatus = true
        }
    }
    
    
    //User
    
    //метод выдает все записи из базы данных
    func getResultUserModel() -> Results<UserModel> {
        realm.objects(UserModel.self)
    }
    
    //метод сохраняет данные о юзер
    func saveUserModel(_ model: UserModel) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    //обновляем пользователя
    func updateUserModule(model: UserModel) {
        
        let users = realm.objects(UserModel.self)
        
        try! realm.write {
            users[0].userFirstName = model.userFirstName
            users[0].userSecondName = model.userSecondName
            users[0].userWeight = model.userWeight
            users[0].userHeight = model.userHeight
            users[0].userTarget = model.userTarget
            users[0].userImage = model.userImage
        }
    }
}
