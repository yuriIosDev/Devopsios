//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//


import Foundation

// ЗАДАНИЕ 1
let boola = true
let boolb = false

if boola && boolb {
    print("Оба условия выполняются")
} else {
    print("Не все условия выполняются")
}

if boola || boolb {
    print("Одно из условий выполняется")
} else {
    print("Оба условия ложные")
}

if boola && boolb {
    print("Оба условия выполняются")
} else if boola || boolb {
    print("Одно из условий выполняется")
} else {
    print("Оба условия ложные")
}


// ЗАДАНИЕ 2
let num = 7

if num % 2 == 0 {
    print("Число четное")
} else {
    print("Число нечетное")
}


// ЗАДАНИЕ 3
let ageYuri = 19 // Укажите возраст человека
let haveTicket = true // Укажите, есть ли у человека билет
if ageYuri >= 18 && haveTicket {
    print("Добро пожаловать!")
} else {
    print("Доступ запрещен")
}


// ЗАДАНИЕ 4
let lastName = "Kuznetcov"
let firstName = "Yuri"
let patronymic = "Viktorovich"

let fullName = lastName + " " + firstName + " " + patronymic
print(fullName)


// ЗАДАНИЕ 5
let a: Int = 8
let b: Int = 10

let addition = a + b
print(addition)

let subtraction = a - b
print(subtraction)

let multiplication = a * b
print(multiplication)

let division = a / b
print(b != 0 ? division : "На 0 делить нельзя!")

// ЗАДАНИЕ 6
let doubleNumber: Double = 123456789.123456789
let floatNumber: Float = 123456789.123456789

// Вывожу значения с максимальной точностью
print("Значение Double: \(doubleNumber)")
print("Значение Float: \(floatNumber)")

// Показываю разницу в точности
let smallValue: Float = 0.000000001
let resultFloat = floatNumber + smallValue
let resultDouble = doubleNumber + Double(smallValue)

// Выводим результаты
print("\nДобавление очень маленького значения:")
print("Float: \(resultFloat)")
print("Double: \(resultDouble)")

// ЗАДАНИЕ 7
let age = 33

if age >= 18 {
    print("Совершеннолетний")
} else {
    print("Не совершеннолетний")
}


// ЗАДАНИЕ 8
// Вывод первых 10 натуральных чисел
for i in 1...10 {
    print(i)
}

// Перевод строки для удобства чтения вывода
print("\n")

// Вывод квадратов первых 10 натуральных чисел
for i in 1...10 {
    let square = i * i
    print(square)
}

// ЗАДАНИЕ 9
let bool1 = true
let bool2 = false

if bool1 && bool2 {
    print("Оба условия выполняются")
} else {
    print("Не все условия выполняются")
}

// Задание 10
let bool11 = true
let bool22 = false

if bool11 || bool22 {
    print("Хотя бы одно из условий выполняется")
} else {
    print("Оба условия ложны")
}


// Задание 11
// Функция для определения четности числа
func checkEvenOdd(number: Int) {
    if number % 2 == 0 {
        print("Число четное")
    } else {
        print("Число нечетное")
    }
}

// ЗАДАНИЕ 12
let isAdult = true
let hasTicket = true

if isAdult || hasTicket {
    if isAdult && hasTicket {
        print("Добро пожаловать!")
    } else {
        if isAdult {
            print("Доступ запрещен. Нет билета")
        } else {
            print("Доступ запрещен. Несовершеннолетний")
        }
    }
} else {
    print("Доступ запрещен")
}
