//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//

import Foundation


// задание 1

class Car {
    var brand: String
    var model: String
    var year: Int
    
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }

    func performAction() {

        print("Car is performing an action.")
    }
}

let myCar = Car(brand: "Toyota", model: "Camry", year: 2022)
print("My car: \(myCar.brand) \(myCar.model), Year: \(myCar.year)")

myCar.performAction()


// задание 2

class Car {
    var brand: String
    var year: Int
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }
    
    func startEngine() {
        print("Двигатель запущен")
    }
}

class TrunkCar: Car {
    var cargoCapacity: Double
    
    init(brand: String, year: Int, cargoCapacity: Double) {
        self.cargoCapacity = cargoCapacity
        super.init(brand: brand, year: year)
    }
    
    func loadCargo() {
        print("Грузовик загружен")
    }
}

class SportCar: Car {
    var maxSpeed: Int
    
    init(brand: String, year: Int, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        super.init(brand: brand, year: year)
    }
    
    func accelerate() {
        print("Ускорение до максимальной скорости")
    }
}

let trunkCar = TrunkCar(brand: "Грузовик", year: 2022, cargoCapacity: 5000.0)
trunkCar.startEngine()
trunkCar.loadCargo()
print("Грузоподъемность: \(trunkCar.cargoCapacity) кг")

let sportCar = SportCar(brand: "Спорткар", year: 2022, maxSpeed: 300)
sportCar.startEngine()
sportCar.accelerate()
print("Максимальная скорость: \(sportCar.maxSpeed) км/ч")


// задание 3

enum CarAction {
    case start
    case stop
    case accelerate
    case brake
    case openTrunk
    case loadCargo
    case launchTurbo
    case engageSportMode
}

let trunkCarAction: CarAction = .loadCargo
let sportCarAction: CarAction = .launchTurbo


// задание 4

class Car {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    func performAction() {
        print("Общее действие для всех автомобилей")
    }
}

class TrunkCar: Car {
    var cargoCapacity: Int
    
    init(brand: String, cargoCapacity: Int) {
        self.cargoCapacity = cargoCapacity
        super.init(brand: brand)
    }
    
    override func performAction() {
        print("Погрузка груза в грузовик \(brand) с грузоподъемностью \(cargoCapacity) тонн.")
    }
}

class SportCar: Car {
    var topSpeed: Int
    
    init(brand: String, topSpeed: Int) {
        self.topSpeed = topSpeed
        super.init(brand: brand)
    }
    
    override func performAction() {
        print("Ускорение на спортивном автомобиле \(brand) до \(topSpeed) км/ч.")
    }
}

let trunkCar = TrunkCar(brand: "Volvo", cargoCapacity: 5000)
let sportCar = SportCar(brand: "Ferrari", topSpeed: 300)

trunkCar.performAction()
sportCar.performAction()


// задание 5

enum CarAction {
    case startEngine
    case stopEngine
    case loadCargo(volume: Int)
    case unloadCargo(volume: Int)
}

class Car {
    var brand: String
    var year: Int

    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }

    func displayProperties() {
        print("Марка: \(brand), Год: \(year)")
    }
}

class TrunkCar: Car {
    var cargoVolume: Int

    init(brand: String, year: Int, cargoVolume: Int) {
        self.cargoVolume = cargoVolume
        super.init(brand: brand, year: year)
    }

    override func displayProperties() {
        super.displayProperties()
        print("Объем багажника: \(cargoVolume)")
    }

    func performAction(_ action: CarAction) {
        switch action {
        case .startEngine:
            print("Запуск двигателя грузовика")
        case .stopEngine:
            print("Остановка двигателя грузовика")
        case .loadCargo(let volume):
            cargoVolume += volume
            print("Грузовик загружен на \(volume) единиц")
        case .unloadCargo(let volume):
            cargoVolume -= volume
            print("Грузовик разгружен на \(volume) единиц")
        }
    }
}

class SportCar: Car {
    var isTurbocharged: Bool

    init(brand: String, year: Int, isTurbocharged: Bool) {
        self.isTurbocharged = isTurbocharged
        super.init(brand: brand, year: year)
    }

    override func displayProperties() {
        super.displayProperties()
        let turbochargedText = isTurbocharged ? "Турбонаддув: Да" : "Турбонаддув: Нет"
        print(turbochargedText)
    }

    func performAction(_ action: CarAction) {
        switch action {
        case .startEngine:
            print("Запуск двигателя спортивной машины")
        case .stopEngine:
            print("Остановка двигателя спортивной машины")
        default:
            print("Эта операция не поддерживается для спортивной машины")
        }
    }
}

let trunkCar = TrunkCar(brand: "Volvo", year: 2022, cargoVolume: 200)
let sportCar = SportCar(brand: "Ferrari", year: 2022, isTurbocharged: true)

trunkCar.performAction(.startEngine)
trunkCar.performAction(.loadCargo(volume: 50))
trunkCar.displayProperties()

sportCar.performAction(.startEngine)
sportCar.displayProperties()
