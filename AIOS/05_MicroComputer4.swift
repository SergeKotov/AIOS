//
//  05_MicroComputer4.swift
//  AIOS
//
//  Created by Serge Kotov on 27.07.2022.
//

import Foundation

// The updated version of micro computer extended with new properties and commands

class ProComp: MicroComp {
    
    // willSet, didSet
    var powerOn: Bool = false {
        willSet {
            if newValue {
                print("loading...")
                sleep(1)
                print("ready 🧩\n")
            } else {
                print("leaving...")
                sleep(1)
            }
        }
        didSet {
            if powerOn {
                runOS()
            } else {
                print("Goodbye...\n")
                exit(220)
            }
        }
    }
    
    override init(ver: String) {
        super.init(ver: ver)
        commandList = commandList.union(["date", "save", "load"])
    }
    
    override func handleCommand(input: [String]) -> Bool {
        var handling = true
        let keyword = input[0]
        switch keyword {
        case "exit":
            powerOn = false
        case "date":
            print(date)
        case "save":
            memory = input.dropFirst().reduce("") { $0 + " " + $1 }
            print("ok, saved")
        case "load":
            print(memory)
        default:
            // вызов родительского метода
            handling = super.handleCommand(input: input)
        }
        return handling
    }

    // MARK: Private section
    
    // calculated property
    private var date: String {
        let current = Date().formatted(date: .complete, time: .omitted)
        return "Current date: \(current)"
    }
    
    // getter and setter
    var memory: String {
        get {
            UserDefaults.standard.string(forKey: "memory") ?? "Hello world!"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "memory")
        }
    }
}

