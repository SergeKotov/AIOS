//
//  08_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 26.01.2023.
//

protocol Descriptive {
    var description: String { get }
}

let sample8 = {
    
    // MARK: #1 Protocol as a type
    
    struct Anarchy: Descriptive {
        let description = "I am mother"
    }
    
    class `Protocol`: Descriptive {
        let description = "I am father"
    }
    
    enum Order: Descriptive {
        case son, daughter
        var description: String { "I am child" }
    }
    
    let family: [Descriptive] = [Anarchy(),
                                 `Protocol`(),
                                 Order.son]
    
    _ = family.map { print($0.description) }
    
    // MARK: #1 Protocol as an existential type
    
    func printDescription(t: Descriptive) {
        print(t.description)
    }

    let newSon = Order.son
//    newSon.description = "I am new heir" // error: only get access possible
}
