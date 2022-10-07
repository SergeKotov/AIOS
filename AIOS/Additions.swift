//
//  Additions.swift
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
    
    override func turn() {
        do {
            try makeTurn()
        } catch {
            print("Illegal move! Let's play AI:")
            super.turn()
        }
    }

    private func makeTurn() throws {
        
        guard let nim else {
            throw GameError.gameNotExist
        }
        
        var nonEmptyHeaps = nim.heaps.filter { heap in heap != 0 }
        if nonEmptyHeaps.isEmpty {
            print("\(name) lost\n")
            exit(0)
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
        }
    }
}
