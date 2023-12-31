//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//

import Foundation


// задание

struct Calculator<T> {
    func performOperation(_ value1: T, _ value2: T, operation: (T, T) -> T) -> T {
        return operation(value1, value2)
    }
}
struct Contact<T> {
    var firstName: T
    var lastName: T
    var phoneNumber: T
    
    func printContactDetails() {
        print("Full Name: \(firstName) \(lastName), Phone Number: \(phoneNumber)")
    }
}
struct MyArray<T> {
    var elements: [T]
    
    mutating func filterContacts(byLastNamePredicate: (T) -> Bool) {
        elements = elements.filter { byLastNamePredicate($0) }
    }
    mutating func shuffle(using comparator: (T, T) -> Bool) {
        elements.shuffle { comparator($0, $1) }
    }
}

// основная программа
let intCalculator = Calculator<Int>()

let additionResult = intCalculator.performOperation(5, 3, operation: +)
let subtractionResult = intCalculator.performOperation(10, 4, operation: -)

print("Addition Result: \(additionResult)")
print("Subtraction Result: \(subtractionResult)")

var contactsArray = MyArray(elements: [
    Contact(firstName: "John", lastName: "Doe", phoneNumber: "123-456-7890"),
    Contact(firstName: "Jane", lastName: "Smith", phoneNumber: "987-654-3210"),
    Contact(firstName: "Ivan", lastName: "Ivanov", phoneNumber: "555-123-4567"),
    Contact(firstName: "Alice", lastName: "Johnson", phoneNumber: "333-111-2222")
])

contactsArray.filterContacts { contact in
    if let lastName = contact.lastName as? String {
        return lastName.hasPrefix("I")
    }
    return false
}

for contact in contactsArray.elements {
    contact.printContactDetails()
}

var shuffledContactsArray = contactsArray
shuffledContactsArray.shuffle { _, _ in
    return Bool.random() // случайный порядок
}

print("Shuffled Contacts:")
for contact in shuffledContactsArray.elements {
    contact.printContactDetails()
}
