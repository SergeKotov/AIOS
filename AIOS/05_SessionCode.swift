//
//  05_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 18.01.2023.
//

import Foundation

let sample5 = {
    
    // MARK: #0 get, set, willSet, didSet, lazy
    
    class Circle {
        lazy var radius = 3.0 {
            willSet {
                print("New radius will set to \(newValue)")
            }
            didSet {
                print("New radius did set to \(radius)")
            }
        }
        
        var area: Double {
            
            get { return .pi * pow(self.radius, 2) }
            
            set(newArea) {
                self.radius = sqrt(newArea/Double.pi)
            }

        }
        
        init(radius: Double) {
            self.radius = radius
        }
        
        func circumference() -> Double {
            return 2 * Double.pi * radius
        }
    }

    let circle = Circle(radius: 3.0)
    print(circle.radius)
    print(circle.area)
    circle.area = 28
    print(circle.radius)
    
    // MARK: #1 Static properties

    class SecretAgent {
        var name: String
        
        static var count = 0 {
            didSet {
                let n = "agent" + (count != 1 ? "s" : "")
                print("The secret service has \(count) \(n)")
            }
        }
        
        
        init(name: String) {
            self.name = name
            print("New agent is: \(name)")
            
            Self.count += 1
        }
    }

    let _ = SecretAgent(name: "J")
    let _ = SecretAgent(name: "K")
    let _ = SecretAgent(name: "007")

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
