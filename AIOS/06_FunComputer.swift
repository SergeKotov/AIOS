//
//  06_FunComputer.swift
//  AIOS
//
//  Created by Serge Kotov on 01.08.2022.
//

import Foundation


// built-in сlosures
let printClosure: (String) -> Void = { string in print(string) }
let saveClosure: (String) -> Void = { UserDefaults.standard.set($0, forKey: "memory") }
let loadClosure: () -> String = { UserDefaults.standard.string(forKey: "memory") ?? "" }
let time: () -> String = { "Current time: " + Date().formatted(date: .omitted, time: .shortened) }

// add-on closures
let turnOff: (FunComputer) -> Void = { computer in computer.powerOn = false }

// new version for the retro computer
class FunComputer {
    
    var powerOn: Bool = true {
        didSet {
            if powerOn {
                print("AIOS Computer ver. 2.0\n")
            } else {
                print("Goodbye...\n")
            }
        }
    }

    var commandList: String { "Available commands: \(closures.keys)" }

    enum Command {
        case strToVoid((String) -> Void)
        case voidToStr(() -> String)
        case void(() -> Void)
        case computer((FunComputer) -> Void)
    }
    
    // lazy property
    lazy var closures: [String : Command] = [
        "print": .strToVoid(printClosure),
        "save": .strToVoid(saveClosure),
        "load": .voidToStr(loadClosure),
        "time": .voidToStr(time)
    ]
    
    func runOS() {
        print("AIOS Computer ver. 2.0\n")
        
        while powerOn {
            print(">", terminator: " ")
            let commandLine = readLine()!.components(separatedBy: " ")
            let keyword = commandLine[0]
            switch keyword {
            case "help":
                print(commandList)
            default:
                if let closure = closures[commandLine[0]] {
                    switch closure {
                    case .strToVoid(let run):
                        if commandLine.count > 1 {
                            run(commandLine[1])
                        } else {
                            print("uncorrect format for the command \(commandLine[0])")
                        }
                    case .voidToStr(let str):
                        print(str())
                    case .void(let code):
                        code()
                    case .computer(let action):
                        action(self)
                    }
                } else {
                    print("uncorrect command")
                }
            }
        }
    }
    
    func upgrade(name: String, command: Command) {
        closures[name] = command
    }
}


// Run
let funComputer = {
    let computer = FunComputer()
    
    computer.upgrade(name: "turnoff", command: .computer(turnOff))
    computer.upgrade(name: "date", command: .voidToStr({ "Current date: " + Date().formatted(date: .numeric, time: .omitted) }))
    computer.upgrade(name: "swift", command: .void(swiftTest))
    
    computer.runOS()
}

/*
// Closure examples
// 1
 func function(_ name: String, _ age: Int) -> String {
     "Name is: \(name). Age is: \(age)"
 }

 let closure = { (name: String, age: Int) -> String in
     "Name is: \(name). Age is: \(age)"
 }

 let a = function("Anna", 18)
 let b = closure("Anna", 18)
 print(a)
 print(b)
 print("\n")

// 2
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella", "Alibaba"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

print(reversedNames)
print()

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in s1 > s2 } )

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

reversedNames = names.sorted(by: { $0 > $1 } )

reversedNames = names.sorted(by: >)

// 3
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
    let a = users.filter { $0.first == "C" }
    print(a)
}
*/
