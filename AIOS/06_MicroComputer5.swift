//
//  MicroComputer5.swift
//  AIOS
//
//  Created by Serge Kotov on 01.08.2022.
//

import Foundation

// convenient type aliases
typealias StrToVoid = (String) -> Void
typealias VoidToStr = () -> String
typealias VoidVoid = () -> Void

// Micro Computer with closures
class FunComp: ProComp {

    // enum with closures as associated values
    enum CommandEx {
        case strToVoid(StrToVoid)
        case voidToStr(VoidToStr)
        case void(VoidVoid)
        case computer((FunComp) -> Void)
    }
    
    // dictionary of commands
    private var commands: [String : CommandEx] = [:]
    
    override init(ver: String) {
        super.init(ver: ver)
        
        // add new command
        upgrade(name: "print", command: .strToVoid { string in print(string) })
    }
    
    override func handleCommand(input: [String]) -> Bool {
        var handling = true
        let keyword = input[0]
        
        // check new commands
        if let closure = commands[keyword] {
            switch closure {
            case .strToVoid(let run):
                if input.count > 1 {
                    let reducedString = input.dropFirst().reduce("") { $0 + " " + $1 }
                    run(reducedString)
                } else {
                    print("uncorrect format for the command \(keyword)")
                }
            case .voidToStr(let str):
                print(str())
            case .void(let code):
                code()
            case .computer(let action):
                action(self)
            }
        } else {
            handling = super.handleCommand(input: input)
        }
        return handling
    }
    
    func upgrade(name: String, command: CommandEx) {
        commands[name] = command
        commandList = commandList.union([name])
    }
}


let upgrade = { (comp: FunComp) -> Void in
    comp.settings.version = "6.1"
    _ = comp.handleCommand(input: ["print", "Upgraded to version: \(comp.settings.version)"])
    
    // Attention!!!
    comp.upgrade(name: "upgrade", command: .computer(virus))
}


// Для продвинутых гиков - программа вирус
let virus = { (comp: FunComp) -> Void in
    _ = comp.handleCommand(input: ["print", "Я компьютерный вирус! Учил ли ты замыкания? Сюрприз! 👺"])
    comp.commandList.forEach { comp.upgrade(name: $0, command: .void({})) }
}
