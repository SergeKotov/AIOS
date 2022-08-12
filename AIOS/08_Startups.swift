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

// protocol HeadHunting - see session 02

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


// extension

fileprivate extension Int {
    func square() -> Self { self * self }
}


extension HeadHunting {
    mutating func getCandidates(people: [Programmer]) {
        print("A short list of candidats received.")
    }
    
    func fillVacancy(minRating: Int) -> Programmer? {
        let name = ["Elly", "Dally", "Selly", "Poly", "Dolly", "Mister X", "Sara"].randomElement()!
        let age = Int.random(in: 18...60)
        return Programmer(name: name, age: age)
    }
}

// Run

let bestHeads = HRAgency()
let fatherAndMother = Consalting.family
let digiVision = Startup()
let humanRoboticsInc = AIStartup()
let roboMenLtd = AIStartup()
let нетПроблем = "МММ"
let justNumber = 9

var startupMarket: [Any] = [bestHeads, fatherAndMother, digiVision, humanRoboticsInc, roboMenLtd, нетПроблем, justNumber]

let startups = {
    for startup in startupMarket {
        if let headHunting = startup as? HeadHunting {
            if let candidate = headHunting.fillVacancy(minRating: 8) {
                print("New star is: \(candidate.name)")
            }
        }
    }
    
    for startup in startupMarket {
        if let number = startup as? Int {
            print("\nJust do \(number) as square \(number.square()) for investments")
        }
    }
}

