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

// Элементы функционального программирования
let sampleX = {
    
    // MARK: Пример #1
    
    let wordLog = ["GHbdtn", "Hello", nil, nil, "ПРювет"]
    
    var upperWorlds: [String] = []
    for word in wordLog {
        if word != nil {
            let WORD = word!.uppercased()
            upperWorlds.append(WORD)
        }
    }
    
    let filtered = wordLog.compactMap { $0?.uppercased() }
                          .filter { $0.first == "H"}
    
    print(upperWorlds)
    print(filtered)
    
    // MARK: Другие примеры представлены в файле 02_Candidates.swift
}

/// Ассоциированные значения предназначены для runtime режима.
/// Можно косвенным образом сделать для них ицициализатор как метод
/// Вот пример определения и использования:
let defEnum = {
    enum Rule {
        case one(String)
        case two(String)
        case no
        
        static func get(_ id: Int) -> Self {
            switch id {
            case 1: return .one("Никаких правил")
            case 2: return .two("Смотри правило 1")
            default:
                return .no
            }
        }
    }

    print("Введите id для правила 1, 2 или 3:", terminator: " ")
    let input = Int(readLine()!)!
    var rule = Rule.get(input)

    switch rule {
    case .one(let s), .two(let s):
        print("Мое правило: " + s)
    default:
        print("У меня нет такого правила")
    }
}
