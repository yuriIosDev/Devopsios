//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//


import Foundation


// задание 1

func customSort(numbers: [Int]) -> [Int] {
    guard numbers.count > 1 else {
        return numbers
    }
    
    var sortedArray = numbers

    for i in 0..<sortedArray.count {
        for j in 0..<sortedArray.count - 1 - i {
            if sortedArray[j] > sortedArray[j + 1] {
                let temp = sortedArray[j]
                sortedArray[j] = sortedArray[j + 1]
                sortedArray[j + 1] = temp
            }
        }
    }

    return sortedArray
}

let unsortedArray = [5, 2, 9, 1, 5, 6]
let sortedArray = customSort(numbers: unsortedArray)
print("Отсортированный массив: \(sortedArray)")


// задание 2

func isPalindrome(_ str: String) -> Bool {
    let cleanedStr = str.lowercased().filter { $0.isLetter || $0.isNumber }
    let reversedStr = String(cleanedStr.reversed())
    return cleanedStr == reversedStr
}

let example1 = "radar"
let example2 = "Hello, World!"
let example3 = "A man, a plan, a canal, Panama!"

print(isPalindrome(example1))
print(isPalindrome(example2))
print(isPalindrome(example3))


// задание 3

func sumOfArrayElements(_ array: [Int]) -> Int {
    var sum = 0
    
    for element in array {
        sum += element
    }
    
    return sum
}

let numbers = [1, 2, 3, 4, 5]
let result = sumOfArrayElements(numbers)
print("Сумма элементов массива: \(result)")


// задание 4

func convertToFarhrenheit(celsiusTemperature: Double) -> Double {
    let fahrenheitTemperature = (celsiusTemperature * 9.0/5.0) + 32.0
    return fahrenheitTemperature
}

let celsiusTemperature: Double = 25.0
let convertedTemperature = convertToFarhrenheit(celsiusTemperature: celsiusTemperature)

print("\(celsiusTemperature) градусов Цельсия равны \(convertedTemperature) градусам Фаренгейта.")


// задание 5

struct Contact {
    var name: String
    var phoneNumber: String
    var email: String
}

class AddressBook {
    var contacts: [Contact] = []

    func addContact(name: String, phoneNumber: String, email: String) {
        let newContact = Contact(name: name, phoneNumber: phoneNumber, email: email)
        contacts.append(newContact)
    }

    func searchContactByName(name: String) -> Contact? {
        for contact in contacts {
            if contact.name == name {
                return contact
            }
        }
        return nil
    }
}

let addressBook = AddressBook()

addressBook.addContact(name: "Иванов", phoneNumber: "123456789", email: "ivanov@example.com")
addressBook.addContact(name: "Петров", phoneNumber: "987654321", email: "petrov@example.com")

if let foundContact = addressBook.searchContactByName(name: "Иванов") {
    print("Контакт найден:")
    print("Имя: \(foundContact.name)")
    print("Телефон: \(foundContact.phoneNumber)")
    print("Email: \(foundContact.email)")
} else {
    print("Контакт не найден.")
}


// задание 6

func rearrangeArray<T>(_ array: [T]) -> [T] {
    guard array.count >= 2 else {
        return array
    }

    var newArray = array
    let firstElement = newArray.removeFirst()
    newArray.append(firstElement)
    let lastElement = newArray.removeLast()
    newArray.insert(lastElement, at: 0)

    return newArray
}

let originalArray = [1, 2, 3, 4, 5]
let rearrangedArray = rearrangeArray(originalArray)
print(rearrangedArray)


// задание 7

func capitalizeFirstLetterOfEachWord(inputString: String) -> String {
    let words = inputString.components(separatedBy: " ")
    
    let capitalizedWords = words.map { word in
        guard let firstLetter = word.first else {
            return ""
        }
        return String(firstLetter.uppercased()) + String(word.dropFirst())
    }
    
    let resultString = capitalizedWords.joined(separator: " ")
    
    return resultString
}

let inputStringB = "пример строки для форматирования"
let formattedString = capitalizeFirstLetterOfEachWord(inputString: inputStringB)
print(formattedString)


// задание 8

func convertDayOfWeekToString(dayOfWeek: String) -> Int? {
    let weekdays = ["понедельник", "вторник", "среда", "четверг", "пятница", "суббота", "воскресенье"]
    
    if let index = weekdays.firstIndex(of: dayOfWeek.lowercased()) {
        return index + 1
    } else {
        return nil
    }
}

let dayOfWeekString = "вторник"
if let dayOfWeekNumber = convertDayOfWeekToString(dayOfWeek: dayOfWeekString) {
    print("Числовой эквивалент для \(dayOfWeekString): \(dayOfWeekNumber)")
} else {
    print("День недели не найден.")
}


// задание 9

func areAllCharactersUnique(_ input: String) -> Bool {
    var uniqueCharacters = Set<Character>()

    for char in input {
        if uniqueCharacters.contains(char) {
            return false
        } else {
            uniqueCharacters.insert(char)
        }
    }
    return true
}

let inputStringAbc = "abcdefg"
let resultPlus = areAllCharactersUnique(inputStringAbc)

if resultPlus {
    print("Строка состоит из уникальных символов.")
} else {
    print("В строке есть повторяющиеся символы.")
}


// задание 10

func объединитьМассивы(_ первыйМассив: [Int], _ второйМассив: [Int]) -> [Int] {
    let объединенныйМассив = первыйМассив + второйМассив
    return объединенныйМассив
}

let массив1 = [1, 2, 3]
let массив2 = [4, 5, 6]

let объединенный = объединитьМассивы(массив1, массив2)
print(объединенный)


// задание 11

func countVowels(in string: String) -> Int {
    let vowels: Set<Character> = Set("aeiouAEIOU")
    var vowelCount = 0
    
    for char in string {
        if vowels.contains(char) {
            vowelCount += 1
        }
    }
    
    return vowelCount
}

let inputStringFs = "Hello, World!"
let resultAbc = countVowels(in: inputStringFs)
print("Количество гласных в строке '\(inputStringFs)': \(resultAbc)")


// задание 12

func removeDuplicates<T: Equatable>(_ array: [T]) -> [T] {
    var uniqueArray = [T]()
    
    for element in array {
        if !uniqueArray.contains(element) {
            uniqueArray.append(element)
        }
    }
    
    return uniqueArray
}

let originalArrayN = [1, 2, 2, 3, 4, 4, 5]
let newArray = removeDuplicates(originalArray)

print(newArray)


// задание 13

func сalculateSum(upTo N: Int) -> Int {
    var sum = 0
    
    for i in 1...N {
        sum += i
    }
    
    return sum
}

let N = 5
let resultA = сalculateSum(upTo: N)
print("Сумма всех чисел до \(N) равна \(resultA)")


// задание 14

func longestWord(in sentence: String) -> String {
    let words = sentence.components(separatedBy: CharacterSet.whitespacesAndNewlines)
    var longestWord = ""
    for word in words {
        if word.count > longestWord.count {
            longestWord = word
        }
    }
    
    return longestWord
}

let inputStringLt = "Это пример строки с несколькими словами, и мы ищем самое длинное слово."
let resultN = longestWord(in: inputStringLt)
print("Самое длинное слово: \(resultN)")


// задание 15

func сократитьСтроку(_ строка: String, до n: Int) -> String {
    if строка.count <= n {
        return строка
    } else {
        let индексКонца = строка.index(строка.startIndex, offsetBy: n)
        let обрезаннаяСтрока = строка[..<индексКонца]
        return обрезаннаяСтрока + "…"
    }
}

let исходнаяСтрока = "Это очень длинная строка, которую нужно сократить"
let новаяСтрока = сократитьСтроку(исходнаяСтрока, до: 20)
print(новаяСтрока)


// задание 16

func объединитьБезДубликатов(_ массив1: [Int], _ массив2: [Int]) -> [Int] {
    var объединенныйМассив = [Int]()
    объединенныйМассив += массив1
    объединенныйМассив += массив2
    let уникальныеЭлементы = Set(объединенныйМассив)
    let результат = Array(уникальныеЭлементы)

    return результат
}

let массив11 = [1, 2, 3, 4, 5]
let массив22 = [3, 4, 5, 6, 7]

let результат = объединитьБезДубликатов(массив1, массив2)
print(результат)


// задание 17

func countWords(ofLength length: Int, in string: String) -> Int {
    let words = string.components(separatedBy: .whitespacesAndNewlines)
    let count = words.filter { $0.count == length }.count
    
    return count
}

let inputStringStr = "Это пример строки для тестирования функции подсчета слов заданной длины."
let wordLengthToCount = 5
let resultNew = countWords(ofLength: wordLengthToCount, in: inputStringStr)

print("Количество слов длины \(wordLengthToCount): \(resultNew)")


// задание 18

func guessTheNumber() {
    let targetNumber = Int.random(in: 1...100)
    var attempts = 0
    var isGuessed = false
    
    print("Добро пожаловать в игру 'Угадай число'!")
    print("Компьютер загадал число от 1 до 100. Попробуйте угадать.")
    
    while !isGuessed {
        attempts += 1
        print("Попытка №\(attempts). Введите вашу догадку:")
        
        if let input = readLine(), let guess = Int(input) {
            if guess == targetNumber {
                isGuessed = true
                print("Поздравляем! Вы угадали число \(targetNumber) за \(attempts) попыток.")
            } else if guess < targetNumber {
                print("Ваша догадка слишком низкая. Попробуйте еще раз.")
            } else {
                print("Ваша догадка слишком высокая. Попробуйте еще раз.")
            }
        } else {
            print("Пожалуйста, введите корректное число.")
        }
    }
}

guessTheNumber()


// задание 19

func encode(_ input: String) -> String {
    var result = ""
    
    for char in input {
        if let unicodeScalar = char.unicodeScalars.first {
            let value = unicodeScalar.value
            let encodedValue = 219 - value  // замена a на z, b на y, и так далее
            let encodedChar = String(UnicodeScalar(encodedValue)!)
            result.append(encodedChar)
        } else {
            result.append(char)
        }
    }
    
    return result
}

func decode(_ input: String) -> String {
    return encode(input)
}

let originalMessage = "hello world"
let encryptedMessage = encode(originalMessage)
let decryptedMessage = decode(encryptedMessage)

print("Исходное сообщение: \(originalMessage)")
print("Зашифрованное сообщение: \(encryptedMessage)")
print("Расшифрованное сообщение: \(decryptedMessage)")


// задание 20

func printEachWordOnNewLine(_ inputString: String) {
    let words = inputString.components(separatedBy: " ")
    
    for word in words {
        print(word)
    }
}

let inputString = "Это пример строки для тестирования"
printEachWordOnNewLine(inputString)


// задание 21

func printWordsWithInterval(sentence: String, interval: TimeInterval) {
    let words = sentence.components(separatedBy: " ")

    var currentIndex = 0

    let queue = DispatchQueue(label: "wordPrintQueue", qos: .utility, attributes: .concurrent)

    let workItem = DispatchWorkItem {
        while currentIndex < words.count {
            print(words[currentIndex])
            currentIndex += 1
            Thread.sleep(forTimeInterval: interval)
        }
    }

    queue.async(execute: workItem)
}

let testSentence = "Это пример предложения для теста функции вывода слов через интервал времени"
let interval: TimeInterval = 1.0

printWordsWithInterval(sentence: testSentence, interval: interval)


// задание 22

func convertSecondsToHoursMinutesSeconds(seconds: Int) -> (hours: Int, minutes: Int, seconds: Int) {
    let hours = seconds / 3600
    let minutes = (seconds % 3600) / 60
    let seconds = (seconds % 3600) % 60

    return (hours, minutes, seconds)
}

let totalSeconds = 19611
let convertedTime = convertSecondsToHoursMinutesSeconds(seconds: totalSeconds)

print("Ожидаемый результат: \(convertedTime.hours) часов \(convertedTime.minutes) минут \(convertedTime.seconds) секунд")
