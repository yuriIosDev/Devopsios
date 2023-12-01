//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//

import Foundation


// Задание 1

func isEven(number: Int) -> Bool {
    return number % 2 == 0
}
let exampleNumber = 10
if isEven(number: exampleNumber) {
    print("\(exampleNumber) четное число.")
} else {
    print("\(exampleNumber) нечетное число.")
}

// Задание 2

func isDivisibleBy3(number: Int) -> Bool {
    return number % 3 == 0
}
let someNumber = 15
if isDivisibleBy3(number: someNumber) {
    print("\(someNumber) делится на 3 без остатка.")
} else {
    print("\(someNumber) не делится на 3 без остатка.")
}

// Задание 3

var numbersArray = Array(1...100)
numbersArray = numbersArray.filter { $0 % 2 != 0 && $0 % 3 == 0 }

print(numbersArray)

// Задание 4

func generateFibonacciNumbers() -> [Int] {
    var fibonacciArray = [0, 1]

    while fibonacciArray.count < 50 {
        let nextFibonacciNumber = fibonacciArray[fibonacciArray.count - 1] + fibonacciArray[fibonacciArray.count - 2]
        fibonacciArray.append(nextFibonacciNumber)
    }

    return fibonacciArray
}
let fibonacciNumbers = generateFibonacciNumbers()
print(fibonacciNumbers)

// Задание 5

func factorial(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    } else {
        return n * factorial(n - 1)
    }
}
let number = 5
let maxNumber = factorial(number)
print("Факториал числа \(number) равен \(maxNumber)")

// Задание 6

// Определение функции калькулятора
func calculator(_ num1: Double, _ num2: Double, operation: String) -> Double? {
    var result: Double?

    switch operation {
    case "+":
        result = num1 + num2
    case "-":
        result = num1 - num2
    case "*":
        result = num1 * num2
    case "/":
        // Проверка деления на ноль
        if num2 != 0 {
            result = num1 / num2
        } else {
            print("Ошибка: Деление на ноль.")
        }
    default:
        print("Ошибка: Недопустимая операция.")
    }

    return result
}

let number1 = 10.0
let number2 = 5.0
let operation = "+"

if let result = calculator(number1, number2, operation: operation) {
    print("Результат \(number1) \(operation) \(number2) равен \(result)")
} else {
    print("Не удалось выполнить операцию.")
}

// Задание 7

func calculateStringLength(_ inputString: String) -> Int {
    let length = inputString.count
    return length
}
let testString = "Пример строки"
let length = calculateStringLength(testString)
print("Длина строки '\(testString)' равна \(length)")

// Задание 8

func findMaximum(_ a: Int, _ b: Int, _ c: Int) -> Int {
    return max(max(a, b), c)
}
let result = findMaximum(10, 5, 8)
print("Максимальное число: \(result)")

// Задание 9

func reverseString(_ input: String) -> String {
    let reversed = String(input.reversed())
    return reversed
}
let userInput = "Привет, мир!"
let reversedString = reverseString(userInput)
print("Исходная строка: \(userInput)")
print("Реверсированная строка: \(reversedString)")
