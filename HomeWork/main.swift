//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//

import Foundation

// задание 1

class Fighter {
    func attack() {
        print("Обычная атака бойца")
    }
    func useUltimateAbility() {
        print("У бойца нет уникальной способности")
    }
}
class Warrior: Fighter {
    override func useUltimateAbility() {
        print("Warrior использует Мощный Удар. Урон в следующей атаке увеличен!")
    }
}
class Mag: Fighter {
    override func useUltimateAbility() {
        print("Mag использует Огненный Взрыв. Урон наносится всем врагам на поле боя!")
    }
}
func startFighter1() {
    let warrior = Warrior()
    warrior.attack()
    warrior.useUltimateAbility()
    warrior.attack()
}
func startFighter2() {
    let mag = Mag()
    mag.attack()
    mag.useUltimateAbility()
    mag.attack()
}
startFighter1()
print("\n")
startFighter2()


// задание 2

class Animal {
    let name: String
    
    required init(name: String) {
        self.name = name
    }
    var type: String {
        return "Животное"
    }
    func sleep() -> String {
        return "\(type) \(name) спит"
    }
}

class Cat: Animal {
    let sound: String
    
    init(name: String, sound: String = "Мяу") {
        self.sound = sound
        super.init(name: name)
    }
    override var type: String {
        return "Кот"
    }
    override func sleep() -> String {
        return "\(super.sleep()) и мурлычет"
    }
    func play() {
        print("\(type) \(name) играет")
    }
}

class Dog: Animal {
    let sound: String
    
    init(name: String, sound: String = "Гав") {
        self.sound = sound
        super.init(name: name)
    }
    override var type: String {
        return "Собака"
    }
    override func sleep() -> String {
        return "\(super.sleep()) и храпит"
    }
    func play() {
        print("\(type) \(name) играет")
    }
}

let cat1 = Cat(name: "Барсик", sound: "Мяу-Мяу")
let dog1 = Dog(name: "Шарик", sound: "Гав-Гав")

print(cat1.type)
print(dog1.type)

print(cat1.sleep())
print(dog1.sleep())

cat1.play()
dog1.play()

let cat2 = Cat(name: "Мурзик")

print(cat2.type) // Кот
print(cat2.sound) // Мяу

print("Звук кота: \(cat1.sound)")
print("Звук собаки: \(dog1.sound)")


// задание 3

protocol PeopleProtocol {
    var name: String { get set }
    var _strength: Int { get set }
    
    func startTrainingFight()
}

protocol FighterProtocol: PeopleProtocol {
    var typeFighter: TypeFighter { get }
}

protocol AttackProtocol: PeopleProtocol {
    func attacking() -> Int
}

enum TypeFighter {
    case warrior
    case mage
}

struct People: PeopleProtocol {
    var name: String
    var _strength: Int
    
    func startTrainingFight() {
        print("\(name) начал(а) тренировку.")
    }
}

struct Warrior: FighterProtocol, AttackProtocol {
    var name: String
    var _strength: Int
    
    var typeFighter: TypeFighter {
        return .warrior
    }
    
    func attacking() -> Int {
        print("\(name) атакует!")
        return _strength * 2
    }
}

struct Mag: FighterProtocol, AttackProtocol {
    var name: String
    var _strength: Int
    
    var typeFighter: TypeFighter {
        return .mage
    }
    
    func attacking() -> Int {
        print("\(name) использует магию!")
        return _strength * 3
    }
}

let person = People(name: "Обычный человек", _strength: 10)
let warrior = Warrior(name: "Воин", _strength: 20)
let mag = Mag(name: "Маг", _strength: 15)

print("Имя: \(person.name), Сила: \(person._strength)")
print("Тип бойца: \(warrior.typeFighter), Урон: \(warrior.attacking())")
print("Тип бойца: \(mag.typeFighter), Урон: \(mag.attacking())")
