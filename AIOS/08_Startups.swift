//
//  08_Startups.swift
//  AIOS
//
//  Created by Serge Kotov on 08.08.2022.
//

import Foundation


// Designing with protocols

enum TaskType {
    case programming, hiring, documenting, testing, etc
}

struct Task {
    let type: TaskType
    var title: String
    var hours: Float
}

// MARK: - HR

protocol HeadHunting {
    func getCandidates(people: [Programmer]) -> [Programmer]
    func fillVacancy(shortList: [Programmer], minRating: Int) -> Programmer?
}

extension HeadHunting {
    func getCandidates(people: [Programmer]) -> [Programmer] {
        print("A short list of candidates with good CV.")
        return people.filter { $0.cv != nil }
    }

    func fillVacancy(shortList: [Programmer], minRating: Int) -> Programmer? {
        let bestCandidate = shortList.randomElement()
        return bestCandidate
    }
}

protocol Onboarding { }

protocol Grading { }

protocol HRService: HeadHunting, Onboarding, Grading {
    
}

// MARK: - MVP (Product)

protocol Programming {
    var backLog: [Task] { get set }

    func addNewTaskToBacklog(title: Task)
    func todo(task: Task)
    func handle(task: Task) -> Bool
    func codeReview(task: Task) -> Bool
    func fixing(task: Task)
}

protocol Testing { }

protocol Documenting { }

protocol CustomerDevelopment { }

protocol ProductDevelopment: CustomerDevelopment, Programming, Testing, Documenting {
    
}

// MARK: - Business

protocol Marketing { }

protocol ClientRelation { }

protocol BusinessDevelopment: Marketing, ClientRelation { }

// MARK: - Others

protocol Fundraising { }

protocol Research { }

protocol ITService { }

protocol Management { }

protocol Administration: Management, ITService { }

// MARK: - Strartups

struct HRAgency: HeadHunting { }

class Startup: HRService, ProductDevelopment, BusinessDevelopment, Fundraising, Administration {
    func addNewTaskToBacklog(title: Task) {
        
    }
    
    func todo(task: Task) {
        
    }
    
    func handle(task: Task) -> Bool {
        true
    }
    
    func codeReview(task: Task) -> Bool {
        true
    }
    
    func fixing(task: Task) {
        
    }
    
    var backLog: [Task]
    
    init() {
        backLog = []
    }
}

final class AIStartup: Startup, Research {

}

enum Consalting: HeadHunting {
    case humanManagement
    case business
    case family
}

// Run

let bestHeads = HRAgency()
let fatherAndMother = Consalting.family
let digiVision = Startup()
let humanRoboticsInc = AIStartup()
let roboMenLtd = AIStartup()
let нетПроблем = "МММ"
let justNumber = 9


let startups = {
    print("\nStartup market:")
    var startupMarket: [HeadHunting] = [bestHeads, fatherAndMother, digiVision, humanRoboticsInc, roboMenLtd]
    for startup in startupMarket {
        let list = startup.getCandidates(people: swiftProgrammers)
        if let candidate = startup.fillVacancy(shortList: list, minRating: 50) {
            print("New star is: \(candidate.name)")
        }
    }


    print("\nPublic market:")
    var publicMarket: [Any] = [bestHeads, fatherAndMother, digiVision, humanRoboticsInc, roboMenLtd, нетПроблем, justNumber]
    for startup in publicMarket {
        if let headHunting = startup as? HeadHunting {
            let list = headHunting.getCandidates(people: swiftProgrammers)
            if let candidate = headHunting.fillVacancy(shortList: list, minRating: 30) {
                print("New star is: \(candidate.name)")
            }
        }
    }
    
    for startup in publicMarket {
        if let number = startup as? Int {
            print("\nJust make \(number) as \(number.squared) for investments\n\n")
        }
    }
}

