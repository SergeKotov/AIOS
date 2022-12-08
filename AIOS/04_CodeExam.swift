//
//  04 Test yourself: reference and value types
//  AIOS
//
//  Created by Serge Kotov on 25.07.2022.
//

import Foundation

// MARK: Data model for the test

enum GoodAnswer: String, CaseIterable {
    case good = "It's good!"
    case fine = "O, fine!"
    case perfect = "Perfecto!"
    case amazing = "Amazing!"
    case outstanding = "Outstanding, guy!"
}

let begin1 = """
struct Hometask {
    var result: String
}

var annaTask = Hometask(result: "Good")
let dimaTask = annaTask

annaTask.result = "Class"
"""

let begin2 = """
class Hometask {
    var task: String
    
    init(task: String) {
        self.task = task
    }
}

struct Student {
    let task: Hometask
}
    
let lessonTask = Hometask(task: "ToDo")

let anna = Student(task: lessonTask)
let sister = anna

anna.task.task = "Dont"
"""

let begin3 = """
struct Hometask {
    var result: String
    
    mutating func thinkAgain() {
        self.result = "New"
    }
}

var annaTask = Hometask(result: "work")
var dimaTask = annaTask

annaTask.result = "Ops"

dimaTask.thinkAgain()
"""

let begin4 = """
enum Names: String {
    case anna
    case dima
    case irina = "Irina"
    case misha = "Michael"
}

let student1 = Names.dima
let student2 = Names.misha
let student3 = Names(rawValue: "irina")
"""

let end1 = """

print(annaTask.result)
"""
        
let end2 = """

print(dimaTask.result)
"""

let end3 = """

print(anna.task.task)
"""

let end4 = """

print(sister.task.task)
"""

let end5 = """

print(annaTask.result)
"""

let end6 = """

print(dimaTask.result)
"""

let end7 = """

print(student1)
"""

let end8 = """

print(student2)
"""

let end9 = """

print(student3?.rawValue)
"""

let end10 = """

print(student2.rawValue)
"""

let guess = [
    1: (begin1, end1, "class"),
    2: (begin1, end2, "good"),
    3: (begin2, end3, "dont"),
    4: (begin2, end4, "dont"),
    5: (begin3, end5, "ops"),
    6: (begin3, end6, "new"),
    7: (begin4, end7, "dima"),
    8: (begin4, end8, "misha"),
    9: (begin4, end9, "nil"),
    10: (begin4, end10, "michael"),
].shuffled()

let swiftTest = {
    var counter = 1
    var wrongAnswers = 0
    
    print("🛳 Welcome to the Dream Company Greenhorn Swift developer test!")
    
    while counter < 10, wrongAnswers < 4 {
        print("\n\n> 🎾 Round \(counter)\n")
        
        print(guess[counter].value.0)
        print(guess[counter].value.1)
        print("\n> What will be printed? 🖨")
        
        let guessAnswer = guess[counter].value.2
        let answer = readLine()?.lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if answer == guessAnswer {
            let symbol = "🏵🥇🎗🎨🎖".randomElement()!
            print(symbol, terminator: " ")
            print(GoodAnswer.allCases.randomElement()!.rawValue)
        } else {
            wrongAnswers += 1
            print("❌ Wrong, the right answer is: '\(guessAnswer)'")
        }
        let _ = readLine()
        
        counter += 1
    }
    
    // check test result
    print("\nYour result is \(counter - wrongAnswers) from \(counter)")
    switch wrongAnswers {
    case 0...2:
        print("🏆 Excellent! Welcome to the board!")
    case 3...4:
        print("🏓 Try once more in next year.")
    default:
        print("👺")
    }
    print("\n")
}
