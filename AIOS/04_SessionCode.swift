//
//  04_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 08.12.2022.
//

import Foundation

let sample4 = {
    
    // MARK: #1 Value and reference
    
    // замените 'struct' на 'class' чтобы увидеть разницу в результате работы кода
    struct Homework {
        var description: String
        
        init(_ description: String) {
            self.description = description
        }
    }
    
    let hw = Homework("My homework")
    
    var annaHw = hw
    print("Anna: \(annaHw.description)")
    
    var dimaHw = annaHw
    annaHw.description = "Homework updated!"
    print("Anna: \(annaHw.description)")
    
    print("Dima: \(dimaHw.description)")
    
    // MARK: #2 is and as
    
    let mix: [Any] = ["Hello",
                      12,
                      Float.pi,
                      Nim(),
                      MCSettings(id: "0", version: "1"),
                      Outcome.win]

    for element in mix {
        switch element {
        case let int as Int:
            print("Это целое число: \(int) и его квадрат равен: \(int*int)")
        case let float as Float:
            print("Это вещ. число: \(float) и его корень: \(sqrt(float))")
        default:
            if element is String {
                print("Это строка: \(element)")
            } else if Mirror(reflecting: element).displayStyle == .class {
                print("Это класс: \(element)")
            } else if Mirror(reflecting: element).displayStyle == .struct {
                print("Это структура: \(element)")
            } else {
                print("Неопознанный тип: \(element)")
            }
        }
    }
}
