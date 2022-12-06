//
//  03_MicroComputer3.swift
//  AIOS
//
//  Created by Serge Kotov on 05.12.2022.
//

import Foundation

// MARK: Fileprivate extension

fileprivate extension Computing {
    func addProgram(name: String, program: @escaping VoidVoid) {}
    func removeProgram(name: String) {}
}

// MARK: - New child class

internal class MicroComp: MicroBase {
    
    // переопределение инициализатора
    override init(ver: String) {
        super.init(ver: ver)        
        commandList.insert("run")
    }
    
    // переопределение метода
    override func handleCommand(input: [String]) -> Bool {
        var handling = true
        let keyword = input[0]
        switch keyword {
        case "run":
            if input.count > 1, let program = programs[input[1]] {
                program()
            } else {
                print("no such program")
            }
        case "time":
            print(getTime())
        default:
            // вызов родительского метода
            handling = super.handleCommand(input: input)
        }
        return handling
    }
    
    // MARK: Private section
    
    // расширяемый список программ
    private var programs = [
        "nim": nimGame,
    ]
    
    // новый метод
    func addProgram(name: String, program: @escaping VoidVoid) {
        guard name != "" else {
            print("error: empty string not allowed")
            return
        }
        programs[name] = program
    }
    
    // еще новый метод
    func removeProgram(name: String) {
        if let _ = programs.removeValue(forKey: name) {
            print("Program \(name) removed")
        } else {
            print("No such program: \(name)")
        }
    }
    
    // новая "перегруженная" версия метода, сигнатура совпадает так как доступ приватный
    private func getTime() -> String {
        let time = Date().formatted(date: .omitted, time: .standard)
        return "Current time: \(time)"
    }
}
