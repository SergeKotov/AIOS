//
//  04_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 08.12.2022.
//

let sample4 = {
    
    // замените 'class' на 'struct' чтобы увидеть разницу в результате работы кода
    class Homework {
        var description: String
        
        init(description: String) {
            self.description = description
        }
    }
    
    let hw = Homework(description: "Welcome to homework!")
    
    let a = hw
    print(a.description)
    
    var b = a
    b.description = "Hello student!"
    print(b.description)
    
    print(a.description)
}
