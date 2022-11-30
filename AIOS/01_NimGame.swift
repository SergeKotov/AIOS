//
//  The Nim game for the Netology Swift AIOS module
//  AIOS01
//
//  Created by Serge Kotov on 15.07.2022.
//

import Foundation

 class Nim {
     // Абстракция
     var heaps = [1, 2, 3, 4, 3, 2, 1]
 }

 class BoardPlayer {
     // Инкапсулация: свойство
     let name: String
  
     // Инкапсулация: метод
     func turn() -> Bool {
         print(name, terminator: " ")
         return true
     }
     
     init(name: String) {
         self.name = name
     }
 }

 class NimPlayer: BoardPlayer { // Наследование
     var nim: Nim?
     
     override func turn() -> Bool {
         var isGaming = super.turn()
         
         if let nim {
             var nonEmptyHeaps = nim.heaps.filter { heap in heap != 0 }
             if nonEmptyHeaps.isEmpty {
                 print("lost 🥵\n")
                 isGaming = false
             } else {
                 // make random move
                 let heapInd = Int.random(in: 0..<nonEmptyHeaps.count)
                 let restNum = nonEmptyHeaps[heapInd]
                 let removedNum = nonEmptyHeaps.count == 1 ? restNum : Int.random(in: 1...restNum)
                 nonEmptyHeaps[heapInd] -= removedNum
                 print("take \(removedNum) from heap \(heapInd+1)\n")
                 nim.heaps = nonEmptyHeaps
             }
         } else {
             print("- no game at present")
             isGaming = false
         }
         
         return isGaming
     }
 }

 struct GameClub {
     
     let players: [NimPlayer]
     
     let game = Nim()
     
     var sessionNumber = 0
     
     mutating func runGameSession() {
         sessionNumber += 1
         print("🧩 Nim game, session #\(sessionNumber) \n")
         game.heaps = [1, 2, 3, 4, 3, 2, 1]
         
         for player in players {
             player.nim = game
         }
         
         isGaming: while true {
             // Полиморфизм
             for player in players {
                 let state = game.heaps.filter { $0 > 0 }
                 print("🎲 \(state)")
                 if !player.turn() {
                     break isGaming
                 }
             }
             _ = readLine()
         }
     }
 }

// Closure: use nimGame() to run the game
let nimGame = {    
    let players = [
        NimPlayer(name: "Steve"),
        NimPlayer(name: "Bill"),
        Me(name: "Student")
    ]
    
    var strangerThings = GameClub(players: players)
    strangerThings.runGameSession() // #1
    strangerThings.runGameSession() // #2
}
