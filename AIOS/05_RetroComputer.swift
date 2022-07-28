//
//  05 Retro computer simulation with command line interpeter
//  AIOS
//
//  Created by Serge Kotov on 27.07.2022.
//

import Foundation

class Computer {
    
    // enum with default string value
    enum Command: String, CaseIterable {
        case help, load, power, run, save
    }
    
    // willSet, didSet
    var powerOn: Bool = false {
        didSet {
            if powerOn {
                print("AIOS Computer ver. 1.0")
                print("   current time: \(time)\n")
                readCommand()
            } else {
                print("Goodbye...\n")
            }
        }
    }

    // calculated properties
    var time: String { Date().formatted(date: .omitted, time: .shortened) }
    var commandList: String { "Available commands: \(Command.allCases)" }

    // getter and setter
    var memory: String {
        get {
            UserDefaults.standard.string(forKey: "memory") ?? "Hello world!"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "memory")
        }
    }

    // lazy property
    lazy var programs = [
        "nim": nimGame,
        "candidates": candidatesSim,
        "mutants": mutantBattle,
        "swift": swiftTest
    ]
    
    // method: tiny operation system :)
    private func readCommand() {
        while powerOn {
            print(">")
            let commandLine = readLine()!.components(separatedBy: " ")
            if (1...2) ~= commandLine.count {
                let keyword = Command(rawValue: commandLine[0])
                switch keyword {
                case .power:
                    if commandLine[1] == "off" {
                        powerOn = false
                    }
                case .help:
                    print(commandList)
                case .save:
                    memory = commandLine.count > 1 ? commandLine[1] : "blank"
                case .load:
                    print(memory)
                case .run:
                    if let program = programs[commandLine[1]] {
                        program()
                    } else {
                        print("no such program")
                    }
                default:
                    print("uncorrect command")
                }
            } else {
                print("unknown command")
            }
        }
    }
}
