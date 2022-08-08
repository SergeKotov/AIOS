//
//  02 The simple company & candidates simulation model
//  AIOS
//
//  Created by Serge Kotov on 16.07.2022.
//

import Foundation

enum Skill: CaseIterable {
    case experience
    case swiftly
}

protocol SwiftCandidate {
    var age: Int { get }
    var cv: String? { get set }
    var skills: [Skill: Int] { get set }
    
    func makeCV() -> String
}

class Programmer: SwiftCandidate {
    let name: String
    
    var age: Int
    var cv: String?
    var skills = [Skill: Int]()
    
    func makeCV() -> String {
        return "\(name), age: \(age)\n  skills:\n\(skills)\n"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        skills = getSkills()
        if chance(0.75) {
            cv = makeCV()
        }
    }
    
    private func getSkills() -> [Skill: Int] {
        var skills = [Skill: Int]()
        for skill in Skill.allCases {
            skills[skill] = Int.random(in: 1...10)
        }
        return skills
    }
}

protocol HeadHunting {
    mutating func getCandidates(people: [Programmer])
    func fillVacancy(minRating: Int) -> Programmer?
}

struct Company: HeadHunting {

    private(set) var candidates: [Programmer]
    
    // MARK: Public interface
    
    mutating func getCandidates(people: [Programmer]) {
        candidates = people.filter { candidate in candidate.cv != nil }
//        candidates = []
//        for guy in people {
//            if guy.cv != nil {
//                candidates.append(guy)
//            }
//        }
    }
    
    func fillVacancy(minRating: Int) -> Programmer? {
        var bestRating = minRating
        var bestCandidate: Programmer?
        for candidate in candidates {
            let rating = rateCandidate(candidate)
            if rating >= bestRating {
                bestCandidate = candidate
                bestRating = rating
            }
        }
        return bestCandidate
    }
    
    // MARK: Private deals
    
    private let someBound = 38
    
    private func rateCandidate(_ candidate: SwiftCandidate) -> Int {
        var rating = candidate.skills.values.reduce(0, +)
//        rating = 0
//        for skill in candidate.skills {
//            rating += skill.value
//        }
        
        if candidate.age > someBound {
            rating -= (candidate.age - someBound)
        }
        
        return rating
    }
}

let candidatesSim = {
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
}
