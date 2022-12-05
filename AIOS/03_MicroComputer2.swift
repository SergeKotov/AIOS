//
//  03_MicroComputer2.swift
//  AIOS
//
//  Created by Serge Kotov on 04.12.2022.
//

import Foundation


// MARK: Fileprivate extension

fileprivate extension Computing {
    func addProgram(name: String, program: @escaping VoidVoid) {}
    func removeProgram(name: String) {}
}

// MARK: - New class ready to inheritance

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
    
    // MARK: Private section
    
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
