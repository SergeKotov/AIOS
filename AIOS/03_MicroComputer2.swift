//
//  03_MicroComputer2.swift
//  AIOS
//
//  Created by Serge Kotov on 04.12.2022.
//

import Foundation


fileprivate extension Computing {
    func addNewProgram(name: String, program: @escaping VoidVoid) {}
}

class MicroComputerV2: Computing {
        
    init() {
        let id = UUID().description
        let currentDateTime = Date()
        self.settings = MCSettings(id: id, sessionStarted: currentDateTime)
    }
    
    var settings: MCSettings
    
    func runOS() {
        print("🏞 AIOS Computer, version 2.0")
        print(getTime(), terminator: "\n\n")
        
        powerOn: while true {
            print("💬", terminator: " ")
            let commandLine = readLine()!.components(separatedBy: " ")
            let keyword = Command(rawValue: commandLine[0])
            switch keyword {
            case .exit:
                print("Goodbye\n")
                break powerOn
            case .help:
                print(getCommandList())
            case .run:
                if commandLine.count > 1, let program = programs[commandLine[1]] {
                    program()
                } else {
                    print("no such program")
                }
            case .settings:
                print("settings: id: \(settings.id) , last started: \(settings.sessionStarted)")
            case .time:
                // здесь время с секундами
                print(getTime(true))
            default:
                print("uncorrect command")
                print(getCommandList())
            }
        }
    }
    
    // новый метод по обновленному протоколу Computing
    func addNewProgram(name: String, program: @escaping VoidVoid) {
        programs[name] = program
    }
    
    // MARK: - Private section
    
    private enum Command: String, CaseIterable {
        case exit, help, run, settings, time, seconds
    }
    
    private func getCommandList() -> String {
        let commandList = Command.allCases.map { $0.rawValue }
        return "Available commands: \(commandList)"
    }
    
    private func getTime() -> String {
        let time = Date().formatted(date: .omitted, time: .shortened)
        return "Current time: \(time)"
    }
    
    // перегрузка метода getTime() с возможностью показа секунд
    private func getTime(_ withSeconds: Bool) -> String {
        let sec: Date.FormatStyle.TimeStyle = withSeconds ? .standard : .shortened
        let time = Date().formatted(date: .omitted, time: sec)
        return "Current time: \(time)"
    }
    
    private var programs = [
        "nim": nimGame,
    ]
}

// Новый дочерний класс с измененными методами
class MicroComputerV3: MicroComputerV2 {
    
    // переопределение метода с добавлением проверки на ошибку
    override func addNewProgram(name: String, program: @escaping VoidVoid) {
        guard name != "" else {
            print("error: empty string not allowed")
            return
        }
        super.addNewProgram(name: name, program: program)
    }
        
}
