//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//

import Foundation


// задание 1

var eventsDictionary = [String: [String]]()

func addEvent(date: String, event: String) {
    if var events = eventsDictionary[date] {
        events.append(event)
        eventsDictionary[date] = events
    } else {
        eventsDictionary[date] = [event]
    }
}

func displayEvents(date: String) {
    if let events = eventsDictionary[date] {
        if events.isEmpty {
            print("На \(date) нет событий.")
        } else {
            print("События на \(date):")
            for event in events {
                print("- \(event)")
            }
        }
    } else {
        print("На \(date) нет событий.")
    }
}

func mainMenu() {
    print("Меню:")
    print("1. Добавить мероприятие")
    print("2. Показать мероприятия на определенную дату")
    print("3. Выйти из приложения")

    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            print("Введите дату (в формате dd.MM.yyyy):")
            if let date = readLine() {
                print("Введите мероприятие:")
                if let event = readLine() {
                    addEvent(date: date, event: event)
                    print("Мероприятие добавлено!")
                } else {
                    print("Ошибка ввода мероприятия.")
                }
            } else {
                print("Ошибка ввода даты.")
            }
        case 2:
            print("Введите дату (в формате dd.MM.yyyy):")
            if let date = readLine() {
                displayEvents(date: date)
            } else {
                print("Ошибка ввода даты.")
            }
        case 3:
            print("Выход из приложения.")
            return
        default:
            print("Неверный ввод. Пожалуйста, выберите существующий пункт меню.")
        }
    } else {
        print("Ошибка ввода. Пожалуйста, введите число.")
    }

    mainMenu()
}

mainMenu()


// задание 2

class SettingsStorage {
    private var settings: [String: String] = [:]

    func setSetting(key: String, value: String) {
        settings[key] = value
        print("Setting '\(key)' is set to '\(value)'")
    }

    func getSetting(key: String) -> String? {
        return settings[key]
    }

    func printAllSettings() {
        print("Current settings:")
        for (key, value) in settings {
            print("\(key): \(value)")
        }
    }
}

let storage = SettingsStorage()

storage.setSetting(key: "Language", value: "English")
storage.setSetting(key: "Theme", value: "Dark")

if let language = storage.getSetting(key: "Language") {
    print("Current language is \(language)")
} else {
    print("Language setting not found")
}

storage.printAllSettings()


// задание 3

let dictionary = ["hello": "привет", "world": "мир", "apple": "яблоко"]

func translateWord(_ word: String) -> String? {
    return dictionary[word]
}

func showMenu() {
    print("Простой англо-русский переводчик")
    print("1. Перевести слово")
    print("2. Выйти из приложения")
    
    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            print("Введите слово на английском:")
            if let inputWord = readLine() {
                if let translation = translateWord(inputWord) {
                    print("Перевод: \(translation)")
                } else {
                    print("Перевод не найден")
                }
            }
            showMenu()
        case 2:
            print("Выход из приложения")
        default:
            print("Некорректный выбор. Попробуйте еще раз.")
            showMenu()
        }
    }
}

showMenu()


// задание 4

var cityDatabase: [String: Set<String>] = [:]

func addCity(to country: String, cityName: String) {
    if var cities = cityDatabase[country] {
        cities.insert(cityName)
        cityDatabase[country] = cities
    } else {
        cityDatabase[country] = [cityName]
    }
}

func removeCity(from country: String, cityName: String) {
    guard var cities = cityDatabase[country] else {
        print("Страна не найдена в базе данных.")
        return
    }

    cities.remove(cityName)
    if cities.isEmpty {
        cityDatabase[country] = nil
    } else {
        cityDatabase[country] = cities
    }
}

func viewCities(in country: String) {
    guard let cities = cityDatabase[country] else {
        print("Страна не найдена в базе данных или у нее нет городов.")
        return
    }

    print("Города страны \(country):")
    for city in cities {
        print("- \(city)")
    }
}

func showMenuA() {
    print("\nМеню:")
    print("1. Добавить город")
    print("2. Удалить город")
    print("3. Просмотреть города страны")
    print("4. Выход")

    if let choice = readLine(), let option = Int(choice) {
        handleMenuOption(option)
    } else {
        print("Некорректный ввод. Пожалуйста, выберите опцию снова.")
        showMenuA()
    }
}

func handleMenuOption(_ option: Int) {
    switch option {
    case 1:
        print("Введите название страны:")
        if let country = readLine() {
            print("Введите название города:")
            if let city = readLine() {
                addCity(to: country, cityName: city)
                print("Город \(city) успешно добавлен к стране \(country).")
            }
        }
    case 2:
        print("Введите название страны:")
        if let country = readLine() {
            print("Введите название города:")
            if let city = readLine() {
                removeCity(from: country, cityName: city)
                print("Город \(city) успешно удален из страны \(country).")
            }
        }
    case 3:
        print("Введите название страны:")
        if let country = readLine() {
            viewCities(in: country)
        }
    case 4:
        print("Выход из приложения.")
        return
    default:
        print("Некорректная опция. Пожалуйста, выберите опцию снова.")
    }

    showMenuA()
}

showMenuA()


// задание 5

func commonElements(_ array1: [Int], _ array2: [Int]) -> [Int] {
    let set1 = Set(array1)
    let set2 = Set(array2)
    
    let intersection = set1.intersection(set2)
    
    let resultArray = Array(intersection)
    
    return resultArray
}

let arrayA = [1, 2, 3, 4, 5]
let arrayB = [3, 4, 5, 6, 7]

let result = commonElements(arrayA, arrayB)
print(result)


// задание 6

var friendsList: [String: Set<String>] = [
    "Alice": ["Bob", "David", "Eve"],
    "Bob": ["Alice", "David"],
    "David": ["Alice", "Bob"],
    "Eve": ["Alice"]
]

func findCommonFriends(user1: String, user2: String) -> Set<String>? {
    guard let friendsUser1 = friendsList[user1], let friendsUser2 = friendsList[user2] else {
        print("Один из пользователей не найден в списке друзей.")
        return nil
    }

    let commonFriends = friendsUser1.intersection(friendsUser2)
    return commonFriends
}

if let commonFriends = findCommonFriends(user1: "Alice", user2: "Eve") {
    print("Общие друзья Alice и Eve: \(commonFriends)")
}


// задание 7

func uniqueElements(array: [Int]) -> [Int] {
    let uniqueSet = Set(array)
    let uniqueArray = Array(uniqueSet)
    return uniqueArray
}

let inputArray = [1, 2, 3, 1, 2, 4, 5]
let resultArray = uniqueElements(array: inputArray)
print(resultArray)


// задание 8

class Phonebook {
    var contacts: [String: String] = [:]
    
    func addNumber(name: String, number: String) {
        contacts[name] = number
        print("Номер \(number) добавлен для \(name) в справочник.")
    }
    
    func removeNumber(name: String) {
        if let removedNumber = contacts.removeValue(forKey: name) {
            print("Номер \(removedNumber) удален для \(name) из справочника.")
        } else {
            print("\(name) не найдено в справочнике.")
        }
    }
    
    func findNumber(name: String) -> String? {
        if let foundNumber = contacts[name] {
            return foundNumber
        } else {
            print("\(name) не найдено в справочнике.")
            return nil
        }
    }
}

let phonebook = Phonebook()


phonebook.addNumber(name: "John", number: "1234567890")
phonebook.addNumber(name: "Jane", number: "9876543210")
phonebook.addNumber(name: "Bob", number: "5551234567")

if let johnNumber = phonebook.findNumber(name: "John") {
    print("Найден номер для John: \(johnNumber)")
}

phonebook.removeNumber(name: "Jane")

let janeNumber = phonebook.findNumber(name: "Jane")

if let janeNumber = janeNumber {
    print("Найден номер для Jane: \(janeNumber)")
} else {
    print("Jane не найдено в справочнике.")
}


// задание 9

var questionsAsked = Set<String>()
var questionsAndAnswers = [String: Int]()
var correctAnswers = 0

func generateUniqueMultiplicationQuestion() -> (question: String, answer: Int) {
    var question: String
    var answer: Int

    repeat {
        let num1 = Int.random(in: 1...10)
        let num2 = Int.random(in: 1...10)
        question = "\(num1) * \(num2) = ?"
        answer = num1 * num2
    } while questionsAsked.contains(question)

    questionsAsked.insert(question)
    questionsAndAnswers[question] = answer

    return (question, answer)
}

func determineGrade(correctAnswers: Int) -> String {
    switch correctAnswers {
    case 8...10:
        return "Отлично!"
    case 6...7:
        return "Хорошо"
    case 4...5:
        return "Удовлетворительно"
    default:
        return "Неудовлетворительно"
    }
}

for _ in 1...10 {
    let questionAndAnswer = generateUniqueMultiplicationQuestion()
    let question = questionAndAnswer.question
    let correctAnswer = questionAndAnswer.answer

    print(question)
    
    if let userAnswer = readLine(), let userAnswerInt = Int(userAnswer) {
        if userAnswerInt == correctAnswer {
            print("Правильно!")
            correctAnswers += 1
        } else {
            print("Неправильно. Правильный ответ: \(correctAnswer)")
        }
    } else {
        print("Ошибка ввода. Правильный ответ: \(correctAnswer)")
    }

    print("\n")
}

let grade = determineGrade(correctAnswers: correctAnswers)
print("Тест завершен. Ваша оценка: \(grade)")


// задание 10

func coinCase(for number: Int) -> String {
    let cases: [Int: String] = [1: "монета", 2: "монеты", 3: "монеты", 4: "монеты"]

    let lastDigit = number % 10
    let lastTwoDigits = number % 100

    if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
        return "монет"
    }

    if let result = cases[lastDigit] {
        return "\(number) \(result)"
    } else {
        return "\(number) монет"
    }
}

let numbers = [1, 2, 5, 11, 23]

for number in numbers {
    let result = coinCase(for: number)
    print(result)
}

// задание 11

func compress(_ input: String) -> String {
    var compressedString = ""
    var currentChar: Character?
    var count = 0

    for char in input {
        if let current = currentChar {
            if char == current {
                count += 1
            } else {
                compressedString.append("\(current)\(count)")
                currentChar = char
                count = 1
            }
        } else {
            currentChar = char
            count = 1
        }
    }

    if let current = currentChar {
        compressedString.append("\(current)\(count)")
    }

    return compressedString.count < input.count ? compressedString : input
}

let resultPl = compress("aabcccccaaa")
print(resultPl)


// задание 12

func findTwoSum(nums: [Int], target: Int) -> (Int, Int)? {
    var numIndices = [Int: Int]()

    for (index, num) in nums.enumerated() {
        let complement = target - num

        if let complementIndex = numIndices[complement] {
            return (complementIndex, index)
        }

        numIndices[num] = index
    }

    return nil
}

let nums = [2, 7, 11, 15]
let target = 9

if let result = findTwoSum(nums: nums, target: target) {
    print("Индексы чисел, сумма которых равна \(target): \(result)")
} else {
    print("Такие числа не найдены")
}


// задание 13

func firstUniqueCharacter(_ s: String) -> Int {
    var charCount = [Character: Int]()

    for char in s {
        charCount[char, default: 0] += 1
    }
    for (index, char) in s.enumerated() {
        if charCount[char] == 1 {
            return index
        }
    }
    return -1
}

let inputString = "leetcode"
let resultSt = firstUniqueCharacter(inputString)
print(resultSt)

