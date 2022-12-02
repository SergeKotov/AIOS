//
//  09_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 02.12.2022.
//


enum NetworkError: Error, CaseIterable {
    case badURL
    case noNetwork
    case missingData
}

func getUsersFromServer(url: String) throws -> [String] {
    
    // network code: с вероятностью chance сгенерируем ошибку
    let problem: NetworkError? = chance(0.5) ? NetworkError.allCases.randomElement()! : nil
    
    if let problem {
        throw problem
    }
    
    let users = ["Anna", "Alex", "Dima"]
    return users
}

let sample9 = {
    
    // Конструкция do - try - catch
    do {
        let newUsers = try getUsersFromServer(url: "https://swapi.dev/api/people")
        print(newUsers)
    } catch {
        print(error)
    }
    
    // Если тип ошибки не интересен, то можно использовать: try?    
    if let newUsers2 = try? getUsersFromServer(url: "https://swapi.dev/api/people") {
        print(newUsers2)
    }
}

