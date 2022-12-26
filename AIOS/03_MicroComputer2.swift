//
//  03_MicroComputer2.swift
//  AIOS
//
//  Created by Serge Kotov on 04.12.2022.
//

import Foundation

// Протокол: что важно для интерфейса?
protocol Computing {
    var settings: MCSettings { get set }
    func runOS()
}

// MARK: New class ready to inheritance

public class MicroBase: Computing {
        
    var commandList: Set<String> = ["exit", "help", "settings", "time"]
    
    var settings: MCSettings
    
    init(ver: String) {
        settings = MCSettings(id: UUID().description, version: ver)
        
        print("🏞 AIOS Computer, version \(settings.version)")
        print(getTime(), terminator: "\n\n")
    }
    
    func runOS() {
        var handling = true
        while handling {
            let commandLine = readCommand()
            handling = handleCommand(input: commandLine)
        }
    }
    
    func handleCommand(input: [String]) -> Bool {
        let keyword = input[0]
        switch keyword {
        case "exit":
            print("Goodbye\n")
            return false
        case "help":
            print(getCommandList())
        case "settings":
            print("settings: id: \(settings.id) , version: \(settings.version)")
        case "time":
            print(getTime())
        default:
            print("uncorrect command")
            print(getCommandList())
        }
        return true
    }
    
    // MARK: Private section
    
    private func getCommandList() -> String {
        return "Available commands: \(commandList)"
    }
    
    private func readCommand() -> [String] {
        print("💬", terminator: " ")
        return readLine()!.components(separatedBy: " ")
    }
    
    private func getTime() -> String {
        let time = Date().formatted(date: .omitted, time: .shortened)
        return "Current time: \(time)"
    }
}
