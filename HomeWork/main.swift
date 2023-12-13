//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//

import Foundation


// Задание 1

struct SportCar {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineRunning: Bool
    var windowsOpen: Bool
    var currentTrunkVolume: Double
}

struct TrunkCar {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineRunning: Bool
    var windowsOpen: Bool
    var currentTrunkVolume: Double
}

var mySportsCar = SportCar(brand: "Ferrari", year: 2022, trunkVolume: 0.5, engineRunning: false, windowsOpen: false, currentTrunkVolume: 0.0)

var myTrunkCar = TrunkCar(brand: "Volvo", year: 2020, trunkVolume: 10.0, engineRunning: true, windowsOpen: true, currentTrunkVolume: 5.0)


// задание 2

enum CarAction {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)

    var availableCargoVolume: Double {

        return 100.0
    }
}

var myCar = CarAction.startEngine
print(myCar)

myCar = CarAction.loadCargo(volume: 50.0)
print(myCar)

switch myCar {
case .startEngine:
    print("Двигатель запущен")
case .stopEngine:
    print("Двигатель остановлен")
case .openWindows:
    print("Окна открыты")
case .closeWindows:
    print("Окна закрыты")
case .loadCargo(let volume) where volume <= myCar.availableCargoVolume:
    print("Груз объемом \(volume) куб. м загружен")
case .loadCargo(let volume):
    print("Невозможно загрузить груз объемом \(volume) куб. м, так как превышен максимально допустимый объем")
case .unloadCargo(let volume):
    print("Груз объемом \(volume) куб. м выгружен")
}


// задание 3

enum CarAction {
    case startEngine
    case stopEngine
    case loadCargo(volume: Int)
    case unloadCargo(volume: Int)
}

struct Car {
    var isEngineRunning = false
    var trunkCapacity = 100

    mutating func performAction(_ action: CarAction) {
        switch action {
        case .startEngine:
            if !isEngineRunning {
                isEngineRunning = true
                print("Двигатель запущен")
            } else {
                print("Двигатель уже запущен")
            }

        case .stopEngine:
            if isEngineRunning {
                isEngineRunning = false
                print("Двигатель остановлен")
            } else {
                print("Двигатель уже остановлен")
            }

        case .loadCargo(let volume):
            if isEngineRunning {
                if trunkCapacity >= volume {
                    trunkCapacity -= volume
                    print("Груз успешно загружен. Остаток места в багажнике: \(trunkCapacity) литров")
                } else {
                    print("Недостаточно места в багажнике")
                }
            } else {
                print("Запустите двигатель, чтобы загрузить груз")
            }

        case .unloadCargo(let volume):
            if isEngineRunning {
                trunkCapacity += volume
                print("Груз успешно выгружен. Остаток места в багажнике: \(trunkCapacity) литров")
            } else {
                print("Запустите двигатель, чтобы выгрузить груз")
            }
        }
    }
}

var myCar = Car()
myCar.performAction(.startEngine)
myCar.performAction(.loadCargo(volume: 50))
myCar.performAction(.unloadCargo(volume: 20))
myCar.performAction(.stopEngine)


// задание 4

enum Action {
    case drive
    case stop
    case honk
}

struct Person {
    var name: String
    var age: Int

    func perform(action: Action) {
        switch action {
        case .drive:
            print("\(name) is driving.")
        case .stop:
            print("\(name) has stopped.")
        case .honk:
            print("\(name) is honking.")
        }
    }
}

struct Car {
    var brand: String
    var model: String
    var year: Int

    func perform(action: Action) {
        switch action {
        case .drive:
            print("\(brand) \(model) is on the move.")
        case .stop:
            print("\(brand) \(model) has come to a stop.")
        case .honk:
            print("\(brand) \(model) is honking.")
        }
    }
}

let person1 = Person(name: "John", age: 30)
let person2 = Person(name: "Alice", age: 25)

let car1 = Car(brand: "Toyota", model: "Camry", year: 2022)
let car2 = Car(brand: "Ford", model: "Mustang", year: 2023)

person1.perform(action: .drive)
person2.perform(action: .stop)

car1.perform(action: .honk)
car2.perform(action: .drive)


// задание 5

enum Action {
    case eat
    case sleep
    case work
}

struct Person {
    var name: String
    var age: Int

    func performAction(_ action: Action) {
        switch action {
        case .eat:
            print("\(name) is eating.")
        case .sleep:
            print("\(name) is sleeping.")
        case .work:
            print("\(name) is working.")
        }
    }
}

let person1 = Person(name: "Alice", age: 25)
let person2 = Person(name: "Bob", age: 30)

person1.performAction(.eat)
person2.performAction(.work)

print("Person 1 - Name: \(person1.name), Age: \(person1.age)")
print("Person 2 - Name: \(person2.name), Age: \(person2.age)")
