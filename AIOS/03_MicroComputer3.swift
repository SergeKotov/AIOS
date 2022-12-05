//
//  03_MicroComputer3.swift
//  AIOS
//
//  Created by Serge Kotov on 05.12.2022.
//

import Foundation

// MARK: New class with extended features

class MicroComputerV3: MicroComputerV2 {

    enum Command: String {
        case exit, help, run, settings, time
    }
    
    // переопределение метода для добавления новой команды
    override func runOS() {
        print("🌠 AIOS Computer, version 3.0")
        print(getTime(), terminator: "\n\n")

        var handling = true
        while handling {
            let (keyword, commandLine) = readCommand()
            handling = handleCommand(keyword: keyword, input: commandLine)
        }
    }
    
    // новый метод взамен приватного в родительском класса
    func readCommand() -> (MicroComputerV3.Command?, [String]) {
        print("💬", terminator: " ")
        let commandLine = readLine()!.components(separatedBy: " ")
        let keyword = Command(rawValue: commandLine[0])
        return (keyword, commandLine)
    }
    
    // перегрузка метода
    func handleCommand(keyword: MicroComputerV3.Command?, input: [String]) -> Bool {
        switch keyword {
        case .time:
            print(getTime(true))
        default:
            if let keyword, let commandV2 = MicroComputerV2.Command(rawValue: keyword.rawValue) {
                return handleCommand(keyword: commandV2, input: input)
            } else {
                print("uncorrect command")
                print(getCommandList())
            }
        }
        return true
    }
    
    // еще одна "приватная" перегрузка
    private func getTime(_ withSeconds: Bool = false) -> String {
        let sec: Date.FormatStyle.TimeStyle = withSeconds ? .standard : .shortened
        let time = Date().formatted(date: .omitted, time: sec)
        return "Current time: \(time)"
    }
}
