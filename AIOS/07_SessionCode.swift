//
//  07_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 17.12.2022.
//

import AppKit

let sample7 = {
    
    // MARK: #1
    
    class Counter {
        
        var countStart: Int {
            return 0
        }
    }

    class OneCounter: Counter {
        
        override var countStart: Int {
            return super.countStart + 1
        }
    }
    
    // MARK: #2
    
    class BoardPlayer {
        
        var name: String
        var alias: String { name }
        
        init(name: String) {
            self.name = name
        }
    }

    class NimPlayer: BoardPlayer {
        
        override var name: String {
            get { "Hello" }
            set { print("Hello") }
        }
        override var alias: String { String(name.first!) }
    }
    
    print(BoardPlayer(name: "Alex").name)
    
    let alex = NimPlayer(name: "Alex")
    print(alex.name = "John")
    
    // MARK: #3
    
    class Point {
        var x, y: Float
        
        init(x: Float, y: Float) {
            self.x = x; self.y = y
        }
        
        convenience init() {
            self.init(x: 0, y: 0)
        }
    }
    
    let onePoint = Point(x: 1, y: 1)
    let zeroPoint = Point()
    
    class ColorPoint: Point {
        var color: CGColor
        
        init(x: Float, y: Float, color: CGColor) {
            self.color = color
            super.init(x: x, y: y)
        }
        
        convenience init() {
            self.init(x: 0, y: 0, color: .clear)
        }
    }
    
    let colorPoint = ColorPoint()
}
