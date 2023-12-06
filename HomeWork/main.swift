//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//

import Foundation


// задание 1

enum Season {
    case winter, spring, summer, fall

    var averageTemperature: Double {
        switch self {
        case .winter:
            return 0.0
        case .spring:
            return 15.0
        case .summer:
            return 25.0
        case .fall:
            return 10.0
        }
    }
}

func printTemperature(for season: Season) {
    print("Средняя температура в \(season): \(season.averageTemperature) градусов Цельсия")
}

let selectedSeason = Season.spring
printTemperature(for: selectedSeason)


// задание 2

enum Transport {
    case car
    case bicycle
    case train
    case airplane
}

struct TransportInfo {
    var maxSpeed: Int
}

func printMaxSpeed(for transport: Transport) {
    let transportInfo: TransportInfo
    
    switch transport {
    case .car:
        transportInfo = TransportInfo(maxSpeed: 200)
    case .bicycle:
        transportInfo = TransportInfo(maxSpeed: 30)
    case .train:
        transportInfo = TransportInfo(maxSpeed: 150)
    case .airplane:
        transportInfo = TransportInfo(maxSpeed: 1000)
    }
    
    print("Максимальная скорость \(transport): \(transportInfo.maxSpeed) км/ч")
}

printMaxSpeed(for: .car)
printMaxSpeed(for: .bicycle)
printMaxSpeed(for: .train)
printMaxSpeed(for: .airplane)


// задание 3

enum PaymentStatus {
    case notPaid
    case processing
    case paid(date: String)
    case error(errorMessage: String)
}

struct Payment {
    var status: PaymentStatus
}

func getPaymentDetails(payment: Payment) {
    switch payment.status {
    case .notPaid:
        print("Статус: Неоплачено")
    case .processing:
        print("Статус: В обработке")
    case .paid(let date):
        print("Статус: Оплачено")
        print("Дата оплаты: \(date)")
    case .error(let errorMessage):
        print("Статус: Ошибка")
        print("Причина ошибки: \(errorMessage)")
    }
}

let unpaidPayment = Payment(status: .notPaid)
let processingPayment = Payment(status: .processing)
let paidPayment = Payment(status: .paid(date: "2023-01-01"))
let errorPayment = Payment(status: .error(errorMessage: "Недостаточно средств"))

getPaymentDetails(payment: unpaidPayment)
getPaymentDetails(payment: processingPayment)
getPaymentDetails(payment: paidPayment)
getPaymentDetails(payment: errorPayment)


// задание 4

enum CameraMode {
    case auto
    case portrait
    case landscape
    case night
    
    func getRecommendation() -> String {
        switch self {
        case .auto:
            return "Режим Авто подходит для общих условий съемки. Камера сама выберет оптимальные настройки."
        case .portrait:
            return "Режим Портрет идеально подходит для фотографий людей, создавая эффект размытого фона."
        case .landscape:
            return "Режим Ландшафт рекомендуется для съемки природы и пейзажей, чтобы передать все детали и широту сцены."
        case .night:
            return "Режим Ночь предназначен для фотографий при недостаточном освещении. Используйте его в темное время суток."
        }
    }
}

let selectedMode = CameraMode.portrait
let recommendation = selectedMode.getRecommendation()
print(recommendation)


// задание 5

enum AnimalType {
    case хищник
    case травоядное
    case насекомое
}

struct Animal {
    let name: String
    let type: AnimalType

    func getDiet() -> String {
        switch type {
        case .хищник:
            return "Хищники едят других животных."
        case .травоядное:
            return "Травоядные питаются растениями."
        case .насекомое:
            return "Насекомые питаются другими насекомыми или растениями."
        }
    }
}

let tiger = Animal(name: "Тигр", type: .хищник)
let giraffe = Animal(name: "Жираф", type: .травоядное)
let bee = Animal(name: "Пчела", type: .насекомое)

print("\(tiger.name): \(tiger.getDiet())")
print("\(giraffe.name): \(giraffe.getDiet())")
print("\(bee.name): \(bee.getDiet())")


// задание 6

enum OrderStatus {
    case accepted
    case preparing
    case readyForServing
    case delivering
}

extension OrderStatus {
    func nextStatus() -> OrderStatus? {
        switch self {
        case .accepted:
            return .preparing
        case .preparing:
            return .readyForServing
        case .readyForServing:
            return .delivering
        case .delivering:
            return nil
        }
    }
}

var currentStatus: OrderStatus = .accepted
print("Текущий статус заказа: \(currentStatus)")

if let nextStatus = currentStatus.nextStatus() {
    print("Следующий статус заказа: \(nextStatus)")
    currentStatus = nextStatus
} else {
    print("Заказ завершен.")
}


// задание 7

enum RoomType {
    case одноместный
    case двухместный
    case люкс
}

struct RoomInformation {
    var стоимость: Double
    var количествоДоступныхНомеров: Int
}

class Hotel {
    var roomInformation: [RoomType: RoomInformation] = [:]

    func добавитьИнформациюОНомере(типКомнаты: RoomType, стоимость: Double, количествоДоступныхНомеров: Int) {
        let информацияОНомере = RoomInformation(стоимость: стоимость, количествоДоступныхНомеров: количествоДоступныхНомеров)
        roomInformation[типКомнаты] = информацияОНомере
    }
    
    func получитьИнформациюОНомере(типКомнаты: RoomType) -> RoomInformation? {
        return roomInformation[типКомнаты]
    }
}

let отель = Hotel()

отель.добавитьИнформациюОНомере(типКомнаты: .одноместный, стоимость: 100.0, количествоДоступныхНомеров: 5)
отель.добавитьИнформациюОНомере(типКомнаты: .двухместный, стоимость: 150.0, количествоДоступныхНомеров: 10)
отель.добавитьИнформациюОНомере(типКомнаты: .люкс, стоимость: 200.0, количествоДоступныхНомеров: 3)

if let информация = отель.получитьИнформациюОНомере(типКомнаты: .двухместный) {
    print("Стоимость: \(информация.стоимость), Доступных номеров: \(информация.количествоДоступныхНомеров)")
} else {
    print("Информация о номере не найдена.")
}


// задание 8

enum DifficultyLevel {
    case easy
    case medium
    case hard
    case expert
}

struct GameParameters {
    var numberOfEnemies: Int
    var timeLimit: Int
}

class GameManager {
    func getGameParameters(for difficulty: DifficultyLevel) -> GameParameters {
        switch difficulty {
        case .easy:
            return GameParameters(numberOfEnemies: 5, timeLimit: 300)
        case .medium:
            return GameParameters(numberOfEnemies: 10, timeLimit: 240)
        case .hard:
            return GameParameters(numberOfEnemies: 15, timeLimit: 180)
        case .expert:
            return GameParameters(numberOfEnemies: 20, timeLimit: 120)
        }
    }
}

let gameManager = GameManager()
let selectedDifficulty = DifficultyLevel.medium
let parameters = gameManager.getGameParameters(for: selectedDifficulty)

print("Уровень сложности: \(selectedDifficulty)")
print("Количество врагов: \(parameters.numberOfEnemies)")
print("Временное ограничение: \(parameters.timeLimit) секунд")


// задание 9

enum Cloudiness: String {
    case clear = "Ясно"
    case partlyCloudy = "Частичная облачность"
    case cloudy = "Облачно"
    case overcast = "Пасмурно"
}

struct WeatherForecast {
    static let precipitationProbability: [Cloudiness: Double] = [
        .clear: 0.1,
        .partlyCloudy: 0.3,
        .cloudy: 0.5,
        .overcast: 0.7
    ]

    static func getWeatherForecast(for cloudiness: Cloudiness) -> String {
        if let probability = precipitationProbability[cloudiness] {
            return "Вероятность осадков: \(probability * 100)%"
        } else {
            return "Невозможно получить прогноз для данного уровня облачности"
        }
    }
}

let selectedCloudiness = Cloudiness.partlyCloudy
let forecast = WeatherForecast.getWeatherForecast(for: selectedCloudiness)
print(forecast)


// задание 10

enum DrinkType {
    case coffee
    case tea
    case hotChocolate
    case water
}

struct VendingMachine {
    static let drinkPrices: [DrinkType: Double] = [
        .coffee: 2.5,
        .tea: 1.8,
        .hotChocolate: 3.0,
        .water: 1.0
    ]

    static func getPrice(for drinkType: DrinkType) -> Double? {
        return drinkPrices[drinkType]
    }
}

let selectedDrink = DrinkType.coffee
if let price = VendingMachine.getPrice(for: selectedDrink) {
    print("Цена напитка \(selectedDrink): $\(price)")
} else {
    print("Выбран неверный тип напитка")
}


// переписать код

enum ResultRequest {
    case success(String)
    case failure(String)
}

var resultData: [Int : String] = [
                                   1: "Данные получены",
                                   2: "Отсутствуует подключение к интернету",
                                   3: "Сервер не отвечает"
                                 ]
let resultRequestData = resultData.randomElement()

func fetchData(for request: String) -> ResultRequest {
    guard let requestData = resultRequestData else {return ResultRequest.failure("запрос не отправлен")}
    
    for (key, value) in [requestData] {
        switch key {
        case 1:
            return ResultRequest.success(value)
        case 2:
            return ResultRequest.failure(value)
        case 3:
            return ResultRequest.failure(value)
        default:
            return ResultRequest.failure("Ошибка \(resultData[key] ?? "")")
        }
    }
    return .failure("некоторый fallback-кейс")
}

let result2 = fetchData(for: "Freeman")

switch result2 {
case .success(let data):
    print("Data: \(data)")
case .failure(let errorMassage):
    print("Error: \(errorMassage)")
}
