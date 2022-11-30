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
