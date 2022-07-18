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

protocol HRService {
    mutating func getCandidates(people: [Programmer])
    func fillVacancy(minRating: Int) -> Programmer?
}

struct Company: HRService {

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
