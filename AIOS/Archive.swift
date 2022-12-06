//
//  OldVersions.swift
//  AIOS
//
//  Created by Serge Kotov on 29.11.2022.
//

import Foundation

// MARK: Game Nim old version

/*
class Nim {
    // Абстракция
    var heaps = [1, 2, 3, 4, 3, 2, 1]
}

class Player {
    // Инкапсулация: свойство
    let name: String
    
    // Инкапсулация: метод
    func turn() {
        print(name, terminator: " ")
    }
    
    init(name: String) {
        self.name = name
    }
}

class NimPlayer: Player { // Наследование
    var nim: Nim?
    
    override func turn() {
        super.turn()
        
        guard let nim else {
            print("The game not loaded")
            exit(1)
        }
        
        var nonEmptyHeaps = nim.heaps.filter { heap in heap != 0 }
        if nonEmptyHeaps.isEmpty {
            print("lost\n")
            exit(0)
        } else {
            let heapInd = Int.random(in: 0..<nonEmptyHeaps.count)
            let restNum = nonEmptyHeaps[heapInd]
            let removedNum = Int.random(in: 1...restNum)
            nonEmptyHeaps[heapInd] -= removedNum
            print("take \(removedNum) from heap \(heapInd+1)\n")
            nim.heaps = nonEmptyHeaps
        }
    }
}

struct GameClub {
    var players: [NimPlayer]
    let game = Nim()
    
    func runSeason() {
        print("Nim game\n")
        
        for player in players {
            player.nim = game
        }
        
        while true {
            // Полиморфизм
            for player in players {
                print(game.heaps.filter { $0 > 0 })
                player.turn()
            }
            _ = readLine()
        }
    }
}

let nim = Nim()

let players = [
    NimPlayer(name: "Steve"),
    NimPlayer(name: "Bill"),
]

let strangerThings = GameClub(players: players)
strangerThings.runSeason()
*/

// MARK: - just another version of MicroComputer

/*
class MicroComputerV2: Computing {
        
    enum Command: String, CaseIterable {
        case exit, help, run, settings, time
    }
    
    var settings: MCSettings
    
    init() {
        let id = UUID().description
        let currentDateTime = Date()
        self.settings = MCSettings(id: id, sessionStarted: currentDateTime)
    }
    
    func runOS() {
        print("🏞 AIOS Computer, version 2.0")
        print(getTime(), terminator: "\n\n")
        
        var handling = true
        while handling {
            let (keyword, commandLine) = readCommand()
            handling = handleCommand(keyword: keyword, input: commandLine)
        }
    }
    
    func handleCommand(keyword: Command?, input: [String]) -> Bool {
        switch keyword {
        case .exit:
            print("Goodbye\n")
            return false
        case .help:
            print(getCommandList())
        case .run:
            if input.count > 1, let program = programs[input[1]] {
                program()
            } else {
                print("no such program")
            }
        case .settings:
            print("settings: id: \(settings.id) , last started: \(settings.sessionStarted)")
        case .time:
            print(getTime())
        default:
            print("uncorrect command")
            print(getCommandList())
        }
        return true
    }
    
    func getCommandList() -> String {
        let commandList = Command.allCases.map { $0.rawValue }
        return "Available commands: \(commandList)"
    }
    
    // новые методы
    func addProgram(name: String, program: @escaping VoidVoid) {
        guard name != "" else {
            print("error: empty string not allowed")
            return
        }
        programs[name] = program
    }
    
    func removeProgram(name: String) {
        if let _ = programs.removeValue(forKey: name) {
            print("Program \(name) removed")
        } else {
            print("No such program: \(name)")
        }
    }
    
    // Private section
    
    private var programs = [
        "nim": nimGame,
    ]
    
    private func readCommand() -> (Command?, [String]) {
        print("💬", terminator: " ")
        let commandLine = readLine()!.components(separatedBy: " ")
        let keyword = Command(rawValue: commandLine[0])
        return (keyword, commandLine)
    }
    
    private func getTime() -> String {
        let time = Date().formatted(date: .omitted, time: .shortened)
        return "Current time: \(time)"
    }
}
*/
