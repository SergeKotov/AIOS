//
//  05_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 18.01.2023.
//

let sample5 = {
    
    // MARK: #1 Static properties and methods

    struct LevelTracker {
        static var highestUnlockedLevel = 1 {
            willSet {
                print("highest unlocked level: \(newValue)")
            }
        }
        
        var currentLevel = 1
        
        static func unlock(_ level: Int) {
            if level > highestUnlockedLevel {
                highestUnlockedLevel = level
            }
        }
        
        // code
    }

    class Player {
        var tracker = LevelTracker()
        let playerName: String
        func complete(level: Int) {
            LevelTracker.unlock(level + 1)
        }
        init(name: String) {
            playerName = name
        }
        
        // code
    }

    var player = Player(name: "Argyrios")
    print("highest level: \(LevelTracker.highestUnlockedLevel)")
    player.complete(level: 1)

    // MARK: #2 Static properties for enums
    
    enum EnumDataStorage { // enum можно заменить на struct или class
        static let rule1 = "Увидеть, значит поверить"
        static let rule2 = "Каждый видит то, во что верит"
        static let rule3 = "Что видит тот, кто не во что не верит?"
        // и так далее
    }
    
    var rule = EnumDataStorage.rule1
    print(rule)
    rule = EnumDataStorage.rule2
    print(rule)
    
    // MARK: #3 Generics
    
    func square<T: Numeric>(_ value: T) -> T {
        return value * value
    }

    let int = 3
    let double = 3.1
    let float = Float(5.2)

    print("Square of \(int) is \(square(int))")
    print("Square of \(double) is \(square(double))")
    print("Square of \(float) is \(square(float))")
    
    let nineSquared = 9.squared
    print(nineSquared) // print 81
}

// MARK: #4 Extension

extension Int {
    var squared: Self { self * self }
}
