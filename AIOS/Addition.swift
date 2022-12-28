//
//  Addition.swift
//  AIOS
//
//  Created by Serge Kotov on 09.08.2022.
//

import Foundation


class Me: NimPlayer {
    
    enum GameError: Error {
        case gameNotExist
        case illegalHeap
        case illegalNum
        case illegalSymbol
    }
    
    override func turn() -> Bool {
        do {
            return try makeTurn()
        } catch {
            print("Illegal move! Let's play AI:")
            return super.turn()
        }
    }

    private func makeTurn() throws -> Bool {
        
        guard let nim else {
            throw GameError.gameNotExist
        }
        
        var nonEmptyHeaps = nim.heaps.filter { heap in heap != 0 }
        if nonEmptyHeaps.isEmpty {
            print("\(name) lost 🥵\n")
            return false
        } else {
            print("Heap?", terminator: " ")
            guard let heapInd = Int(readLine() ?? "1") else {
                throw GameError.illegalSymbol
            }
            guard (1...nonEmptyHeaps.count).contains(heapInd) else {
                throw GameError.illegalHeap
            }
            
            print("How many?", terminator: " ")
            guard let removedNum = Int(readLine() ?? "1") else {
                throw GameError.illegalSymbol
            }
            guard nonEmptyHeaps[heapInd-1] >= removedNum else {
                throw GameError.illegalNum
            }
            
            nonEmptyHeaps[heapInd-1] -= removedNum
            print("\(name) take \(removedNum) from heap \(heapInd)\n")
            nim.heaps = nonEmptyHeaps
            
            return true
        }
    }
}

class VideoNim: Nim {
    
    func show(heaps: [Int]) {
        print(" ", terminator: "")
        for c in heaps {
            let symbol = c > 0 ? "🟢" : "  "
            print(symbol, terminator: "")
        }
        print()
        let nextHeaps = heaps.map { $0 - 1 }
        if (nextHeaps.max() ?? -1) > 0 {
            show(heaps: nextHeaps)
        }
    }
}
