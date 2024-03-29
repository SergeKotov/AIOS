//
//  02_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 07.01.2023.
//

import Foundation

let sample2 = {
    
    // MARK: #1 Struct example
    
    struct Settings {
        let id: String
        var version: String
    }

    var settings = Settings(id: "2023", version: "Happy ")

    settings.version += "new year!"
    
    // MARK: #2  Enum example
    
    enum Command {
        case exit
        case settings
        case help, run, time
    }
/*
    while true {
        let command: Command = Bool.random() ? .exit : .settings

        switch command {
        case .exit:
            print("goodbye!")
            exit(1)
        default:
            print("continue...")
            continue
        }
    }
*/
    // MARK: #3 Raw values
    
    enum ReadCommand: String {
        case exit = "Exit"
        case settings
        case help, run, time
    }
/*
    while true {
        print("Enter a command:", terminator: " ")
        if let command = ReadCommand(rawValue: readLine()!) {
            switch command {
            case .exit:
                print("goodbye!\n")
                exit(1)
            default:
                print("This is command: \(command.rawValue)\n")
            }
        } else {
            print("continue...\n")
        }
    }
*/
    // MARK: #4 Associated values
    
    class Universe { }
        
    enum Anything {
        case name(String)
        case magicNumbers(Int, Int)
        case someClass(Universe)
        case etc
    }

    var something = Anything.name("Taylor")
    something = Anything.name("Swift")

    switch something {
    case .name(let name):
        print(name)
    default:
        break
    }
    
    // MARK: #5 Initialization
    
    struct Computer { // or class
        let rom: Int
        var ram: Int
        
        init(rom: Int, ram: Int) {
            self.rom = rom
            self.ram = ram
        }
        
        func runOS() { }
    }
    
    let bbcMicro = Computer(rom: 16, ram: 48)
    
}
