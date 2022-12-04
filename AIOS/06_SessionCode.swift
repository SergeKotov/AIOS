//
//  06_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 02.12.2022.
//

let sample6 = {
    
    // MARK: #1
    // Пример функции и замыкания с эквивалентным поведением:
    func function(_ name: String) -> String {
        "Name is: \(name)."
    }

    var closure = { (name: String) -> String in
        "Name is: \(name)."
    }

    let a = function("Anna")
    let b = closure("Anna")

    print(a)
    print(b)

    // но замыкания более универсальны:
    closure = { name in "I am Groot" }
    let с = closure("Anna")
    print(с)
    
    // MARK: #2
    // Пример определения замыкания для вычисления
    // квадрата вещественного числа:
    let square = { (number: Double) -> Double in
        let result = number * number
        return result
    }

    let f = 9.0
    let s = square(f)
    print("The square for \(f) is \(s)")
    
    // MARK: #3
    // Замыкания: тип определен аргументами и возвращаемым значением
    
    let description: (String) -> String = { (name: String) -> String in
        "Name is: \(name)."
    }
    print(description("Anna"))

    let echo: (String) -> Void = { (name: String) in
        print("Name is: \(name).")
    }
    echo("Dima")

    let hello: () -> Void = {
        print("Hello world!")
    }
    hello()
    
    // MARK: #4
    // Cокращение синтаксиса замыканий: от сложного к простому:
    
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella", "Alibaba"]

    func backward(_ s1: String, _ s2: String) -> Bool {
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
}
