//
//  03_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 04.12.2022.
//

// "лементы функционального программирования
let sample3 = {
    
    // MARK: Пример #1
    
    let wordLog = ["GHbdtn", "Hello", nil, nil, "ПРювет"]
    
    var upperWorlds: [String] = []
    for word in wordLog {
        if word != nil {
            let WORD = word!.uppercased()
            upperWorlds.append(WORD)
        }
    }
    
    let filtered = wordLog.compactMap { $0?.uppercased() }
                          .filter { $0.first == "H"}
    
    print(upperWorlds)
    print(filtered)
    
    // MARK: Пример #2
    
    struct Person {
        let name: String
        let age: Int
    }
    
    let people = [
        Person(name: "Steve", age: 33),
        Person(name: "Bill", age: 31),
        Person(name: "Ada", age: 55),
        Person(name: "Jon", age: 45),
        Person(name: "Anna", age: 18)
    ]
    
    // пример создания нового массива в функциональной версии и в итеративном варианте
    // класс Programmer представлен в файле 02_Candidates.swift
    let swiftProgrammers = people.map { person in Programmer(name: person.name, age: person.age) }
    //var swiftProgrammers = [Programmer]()
    //for guy in people {
    //    let programmer = Programmer(name: guy.name, age: guy.age)
    //    swiftProgrammers.append(programmer)
    //}
    
    // пример обработки массива с подсчетом суммартного рейтинга в функциональной версии и в итеративном варианте
    let firstCandidate = swiftProgrammers[0]
    let rating = firstCandidate.skills.values.reduce(0, +)
//        rating = 0
//        for skill in candidate.skills {
//            rating += skill.value
//        }
    print("Candidate: \(firstCandidate.name),  rating: \(rating)")
}
