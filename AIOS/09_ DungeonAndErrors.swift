//
//  09_ DungeonAndErrors.swift
//  AIOS
//
//  Created by Serge Kotov on 09.08.2022.
//

import Foundation

// A structure as an Error
struct GameError: Error {
    var description: String
}

// An Error with an associated value
enum DungeonError: Int, Error {
    case ops = -10
    case woops = -70
    case fatalError = -1000
}

// Not an error, a prize!
enum DungeonPrize: Int, Error {
    case coins = 5
    case box = 20
    case princeOrPrincess = 1_000_000
}

// Dungeons & Errors Game
final class DungeonAndErrors {
    let startRoom = 3
    var curRoom: Int
    var rooms = [Int](repeating: 0, count: 42)
    var health = 100
    
    let fineMessage = "Smells like something nice there."
    let amazeMessage = "Smells like something very very nice there."
    let vineMessage = "The vile smell of error wafts here"
    
    init() {
        curRoom = startRoom
        
        // setup the dungeon with errors and prizes
        for ind in 0..<rooms.count {
            if chance(0.35) {
                rooms[ind] = chance(0.5) ? DungeonError.ops.rawValue : DungeonError.woops.rawValue
            } else if chance(0.4) {
                rooms[ind] = chance(0.5) ? DungeonPrize.coins.rawValue : DungeonPrize.box.rawValue
            }
        }
        // set a winning room
        let princessRoom = (0..<rooms.count).randomElement()!
        rooms[princessRoom] = DungeonPrize.princeOrPrincess.rawValue
        // set a room for losers
        let fatalRoom = (0..<rooms.count).randomElement()!
        rooms[fatalRoom] = DungeonError.fatalError.rawValue
    }
    
    func run() throws {
        print("\nDungeons & Errors Game\n")
        
        // handle an error by converting it to an optional value
        if let rules = try? String(contentsOfFile: "Rules") {
            print(rules)
        }
        
        let range = (0...rooms.count)
        
        while true {
            print("Your health: \(health)")
            
            // What's you feel there
            let left = curRoom-1
            let right = curRoom+1
            let up = curRoom+7
            guard range.contains(left),
                  range.contains(right),
                  range.contains(up) else {
                throw GameError(description: "You fell into a bottomless hole")
            }
            
            let l = rooms[left]; if l != 0 { printMessage(l) }
            let r = rooms[right]; if r != 0 { printMessage(r) }
            let u = rooms[up]; if u != 0 { printMessage(u) }
            
            // Move to the new room
            print("\nPress 1 to move left, 2 to move right and 3 to move forward:")
            let str = readLine() ?? ""
            guard let s = Int(str) else {
                throw GameError(description: "Somethings feels to bad..")
            }
            switch s {
            case 1: curRoom -= 1
            case 2: curRoom += 1
            case 3: curRoom += 7
            default:
                throw GameError(description: "The cave has collapsed.")
            }
            
            // What's happening?
            health += rooms[curRoom]
            switch health {
            case -1000...0:
                throw DungeonError.fatalError
            case 0...999:
                let message = health >= 100 ? "You feel fine\n" : "You feel not so good..\n"
                print(message)
            default:
                throw DungeonPrize.princeOrPrincess
            }
        }
    }
    
    private func printMessage(_ value: Int) {
        print( value > 0 ? (value > 1000 ? amazeMessage : fineMessage) : vineMessage)
    }
}

let dangeonsAndErrors = {
    var isGaming = true
    while isGaming {
        do {
            // let's play!
            try DungeonAndErrors().run()
            
            // catch 'errors'
        } catch is DungeonError {
            print("You lose")
        } catch DungeonPrize.princeOrPrincess {
            print("You saved the prince / princess.")
        } catch let gameError as GameError {
            print(gameError.description)
        }
        
        print("Would you like to play the next game? [Y, N]")
        let answer = readLine()?.uppercased() ?? ""
        if answer != "Y" {
            isGaming = false
        }
    }
    
    print("Goodbye\n")
}

