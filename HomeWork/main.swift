//
//  main.swift
//  HomeWork
//
//  Created by Юрий Кузнецов on 29.11.2023.
//

import Foundation


// задание

import Foundation

enum NetworkError: Error {
    case errorURL
    case errorServer(numberError: Int)
    case errorUnknown
    case errorInvalidURL
    case errorInvalidStatusCode(statusCode: Int)
}
typealias ResultQuery<T> = Result<T, NetworkError>


func fetchData<T>(url: URL, completion: @escaping (ResultQuery<T>) -> Void) {
    let isValidURL = arc4random_uniform(2) == 0
    let responseStatusCode = Int(arc4random_uniform(500) + 100)

    guard isValidURL else {
        completion(.failure(.errorInvalidURL))
        return
    }
    if responseStatusCode >= 200 && responseStatusCode < 300 {
        let data: T
        completion(.success(data))
    } else if responseStatusCode == 404 {
        completion(.failure(.errorServer(numberError: 404)))
    } else {
        completion(.failure(.errorInvalidStatusCode(statusCode: responseStatusCode)))
    }
}

let sampleURL = URL(string: "https://example.com")!
fetchData(url: sampleURL) { (result: ResultQuery<String>) in
    switch result {
    case .success(let data):
        print("Успешный запрос. Полученные данные: \(data)")
    case .failure(let error):
        print("Ошибка при запросе: \(error.localizedDescription)")
    }
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .errorURL:
            return NSLocalizedString("Invalid URL", comment: "")
        case .errorServer(let numberError):
            return NSLocalizedString("Server error: \(numberError)", comment: "")
        case .errorUnknown:
            return NSLocalizedString("Unknown error", comment: "")
        case .errorInvalidURL:
            return NSLocalizedString("Invalid URL format", comment: "")
        case .errorInvalidStatusCode(let statusCode):
            return NSLocalizedString("Invalid status code: \(statusCode)", comment: "")
        }
    }
}
