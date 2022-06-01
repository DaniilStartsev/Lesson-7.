//
//  main.swift
//  Lesson-7.
//
//  Created by Daniil.Startsev on 14.05.2022.
//

import Foundation

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum AuthError: Error {
    case wrongPassword
    case dataNotExists
}

class User {
    let truelogin = "Valera"
    let truepassword = "12345"
    
//Проброс
    func  auth(login: String, pwd: String) throws {
        guard login == truelogin else {
            throw AuthError.dataNotExists
        }
        guard pwd == truepassword else {
            throw AuthError.wrongPassword
        }
         print("Привет, Валера!")
    }
}

let userValera = User()
 
// do-catch

do {
    let auth = try userValera.auth(login: "Valer", pwd: "12345")
} catch AuthError.dataNotExists {
    print("Данные не существуют! ")
}  catch AuthError.wrongPassword {
    print("Неверный пароль! ")
} catch {
    print("Какая-то ещё ошибка.")
}


enum  HumanError: Error {
    case wrongApartment
    case wrongFloor
}

class MyHouse {
    let trueFloor = 24
    let trueApartment = 159

    func elevator(floor: Int, apartment: Int) throws {
        guard floor == trueFloor  else {
            throw HumanError.wrongFloor
        }
        guard apartment == trueApartment else {
            throw HumanError.wrongApartment
        
        }
        print("Вы дома!")
    }
}

let house = MyHouse()
try house.elevator(floor: 24, apartment: 159)

do {
    let elevator = try house.elevator(floor: 24, apartment: 159)
} catch HumanError.wrongFloor {
    print("Не тот этаж.")
} catch HumanError.wrongApartment {
    print("Не та квартира.")
}
