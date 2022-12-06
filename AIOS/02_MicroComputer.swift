//
//  02_MicroComputer.swift
//  AIOS
//
//  Created by Serge Kotov on 29.11.2022.
//

import Foundation

// Протокол: что важно для интерфейса?
protocol Computing {
    var settings: MCSettings { get set }
    func runOS()
}

// структура, будет использоваться для нескольких версий компьютера
struct MCSettings {
    let id: String
    let version: String
}

// пример класса, удовлетворяющего требованиям протокола Computing
class MicroComputer: Computing {
    
    // свойство класса + пример агрегации
    var settings: MCSettings
    
    // инициализация объекта (создание экземпляра класса)
    init() {
        settings = MCSettings(id: UUID().description, version: "0.9")
    }
    
    // перечисление с rawValue и возможностью перебора различных case (протокол CaseIterable)
    // пример композиции, перечисление Command определено внутри класса
    enum Command: String, CaseIterable {
        case exit, help, run, settings, time
    }

    // свойство: словарь с замыканиями в качестве value
    var programs = [
        "nim": nimGame, // + пример агрегации, так как nim game существует независимо
    ]
    
    // метод, возвращающий список доступных команд
    func getCommandList() -> String {
        let commandList = Command.allCases.map { $0.rawValue }
        return "Available commands: \(commandList)"
    }
    
    // метод, возвращающий текущее время
    func getTime() -> String {
        let time = Date().formatted(date: .omitted, time: .shortened)
        return "Current time: \(time)"
    }
    
    // method: tiny operation system :)
    func runOS() {
        print("🌇 AIOS Computer, version 1.0")
        print(getTime(), terminator: "\n\n")
        
        powerOn: while true { // работает, пока "включено питание"
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
                print("settings: id: \(settings.id) , version: \(settings.version)")
            case .time:
                print(getTime())
            default:
                print("uncorrect command")
                print(getCommandList())
            }
        }
    }
}
