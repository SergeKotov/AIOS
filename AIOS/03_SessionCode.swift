//
//  03_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 04.12.2022.
//

import Foundation

open class Matryoshka {
    
    public var id = UUID()
    
    fileprivate var matryoshka: Matryoshka?
    
    // доступ к этой функции разрешен только внутри класса
    private func getNewId() -> UUID { UUID() }
    
}

internal let sample3 = {
    
    // MARK: #1 Scope
    
    let matryoshka = Matryoshka()
    matryoshka.matryoshka = Matryoshka()
    matryoshka.matryoshka?.matryoshka = Matryoshka()

    print(matryoshka.id)
    print(matryoshka.matryoshka!.id)
    print(matryoshka.matryoshka!.matryoshka!.id)
    
    
    // MARK: #2 Stored and computed properties
    
    class Computer {
        var settings: MCSettings
        
        var time: String {
            Date().formatted(date: .omitted, time: .shortened)
        }
        
        init(settings: MCSettings) {
            self.settings = settings
        }
    }
    
    let apple2 = Computer(settings: MCSettings(id: "2", version: "1.0"))
    
    apple2.settings.version = "1.1"
    
//    apple2.time = "now" // Error: Cannot assign to property: 'time' is a get-only property
    print(apple2.time)
    
    // MARK: #3 Перегрузка методов
    
    enum Coin {
        case heads, tails
    }
    
    enum Dice: CaseIterable {
        case one, two, three, four, five, six
    }
    
    struct Randomizer {
        
        static func getChance() -> Coin {
            return Bool.random() ? .heads : .tails
        }
        
        static func getChance() -> Dice {
            return Dice.allCases.randomElement()!
        }
    }
    
    let randomCoin: Coin = Randomizer.getChance()
    let randomDice: Dice = Randomizer.getChance()
    
    print(randomCoin, randomDice)
}
