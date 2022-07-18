//
//  main.swift
//  AIOS
//
//  Created by Serge Kotov on 15.07.2022.
//

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

let swiftProgrammers = people.map { person in Programmer(name: person.name, age: person.age) }

//var swiftProgrammers = [Programmer]()
//for guy in people {
//    let programmer = Programmer(name: guy.name, age: guy.age)
//    swiftProgrammers.append(programmer)
//}

for programmer in swiftProgrammers {
    print("CV programmer \(programmer.name)")
    print(programmer.cv ?? "none\n")
}

// get the best candiadte to the dream company
var dreamCompany = Company(candidates: [])
dreamCompany.getCandidates(people: swiftProgrammers)

if let newProgrammer = dreamCompany.fillVacancy(minRating: 12) {
    print("\nCongratulations \(newProgrammer.name)!\nWelcome to the board!\n\n")
} else {
    print("No such candidate!\n")
}

