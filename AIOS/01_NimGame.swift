//
//  The Nim game for the Netology Swift AIOS module
//  AIOS01
//
//  Created by Serge Kotov on 15.07.2022.
//

import Foundation

class Nim {
    var heaps = [1, 2, 3, 4, 3, 2, 1]
}

class Player {
    let name: String
    func turn() { }
    
    init(name: String) {
        self.name = name
    }
}

class NimPlayer: Player {
    var nim: Nim?
    
    override func turn() {
        guard let nim = nim else {
            print("The game not loaded")
            exit(1)
        }
        
        var nonEmptyHeaps = nim.heaps.filter { heap in heap != 0 }
        if nonEmptyHeaps.isEmpty {
            print("\(name) lost")
            exit(0)
        } else {
            let heapInd = Int.random(in: 0..<nonEmptyHeaps.count)
            let restNum = nonEmptyHeaps[heapInd]
            let removedNum = Int.random(in: 1...restNum)
            nonEmptyHeaps[heapInd] -= removedNum
            print("\(name) take \(removedNum) from heap \(heapInd)")
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
            for player in players {
                print(game.heaps)
                player.turn()
            }
            print()
        }
    }
}

