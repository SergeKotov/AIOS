//
//  06_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 02.12.2022.
//

let sample6 = {
    
    // MARK: #1
    // Функция и замыкание с эквивалентным поведением:
    func function(_ name: String) -> String {
        "Name is: \(name)."
    }

    var closure = { (name: String) -> String in
        "Name is: \(name)."
    }

    var name = function("Anna")
    print(name)

    name = closure("Anna")
    print(name)

    // но замыкания более универсальны:
    closure = { name in "I am Groot" }
    name = closure("Anna")
    print(name)
    
    // MARK: #2
    // Пример определения замыкания для вычисления
    // квадрата вещественного числа:
    let square = { (number: Double) -> Double in
        let result = number * number
        return result
    }

    let nine = 9.0
    let sqared = square(nine)
    print("The square for \(nine) is \(sqared)")
    
    // MARK: #3
    // Замыкания: тип определен аргументами и возвращаемым значением
    
    let hello = { // () -> Void
        print("Hello world!")
    }
    hello()
    
    let echo = { (name: String) in // (String) -> Void
        print("Name is: \(name).")
    }
    echo("Dima")
    
    let description = { (name: String) -> String in // (String) -> String
        "Name is: \(name)."
    }
    print(description("Anna"))
    
    // MARK: #4
    // Cокращение синтаксиса замыканий: от сложного к простому:
    
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella", "Alibaba"]

    func backward(s1: String, s2: String) -> Bool {
        return s1 > s2
    }

    var reversed = names.sorted(by: backward)

    reversed = names.sorted(by: { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })

    reversed = names.sorted(by: { (s1: String, s2: String) -> Bool in s1 > s2 } )

    reversed = names.sorted(by: { s1, s2 in s1 > s2 } )

    reversed = names.sorted(by: { $0 > $1 } )

    reversed = names.sorted(by: >)

    print(reversed)
    
    // MARK: #5
    
    // Completion and trailing closure:
    func fetchUsersFromServer(url: String, completion: @escaping ([String]) -> Void) {
        // some long network operation
        let result = ["Chris", "Alex", "Ewa", "Barry", "Daniella", "Alibaba"]

        completion(result)
    }

    fetchUsersFromServer(url: "https://github.com", completion: { (users) -> Void in
        let a = users.filter { $0.first == "A" }
        print(a)
    })

    fetchUsersFromServer(url: "https://github.com") { users in
        let a = users.filter { $0.first == "A" }
        print(a)
    }
    
    // MARK: #6
    
    let wordLog = ["param", "Hello", nil, nil, "ПРивЕт"]

    // обработка коллекции в итеративным методом
    var upperWorlds: [String] = []
    for word in wordLog {
        if word != nil {
            let WORD = word!.uppercased()
            upperWorlds.append(WORD)
        }
    }
    print(upperWorlds)
    
    // обработка коллекции функциональным методом с аналогичным результатом
    let sameWorlds = wordLog.compactMap { $0?.uppercased() }
    print(sameWorlds)    
}
