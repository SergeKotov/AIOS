//
//  01_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 22.12.2022.
//

let sample1 = {
    
    // MARK: #1
    
    enum СurrentLevel: String {
        case A = "Программист, изучающий новый язык"
        case B = "Любитель, решивший стать профи"
        case C = "Новичок, изучающий свой первый язык"
    }
    
    var mylevel: СurrentLevel = .A // or .B or .C
    // пожалуйста напишите в чате:
    print(mylevel)
    
    // MARK: #2
    
    func prepareScrambledEggs() {
        func smashEachWithKnife() { /* code */ }
        func throwShells() { /* code */ }
        func pourContentsIntoPan() { /* code */ }
        func takeTwoChickenEggs() { /* code */ }
        func putFryingPanOnFire() { /* code */ }
    }
    
    class Egg { }
    class Pan { }
    
    struct ScrambledEggs {
        var eggs: [Egg]
        var pan: Pan
        
        func cookScrambledEggs() {
            prepareScrambledEggs()
            // code
            print("Perfect scrambled eggs just cooked!")
        }
    }
    
    let eggs = [Egg(), Egg()]
    let pan = Pan()
    let dish = ScrambledEggs(eggs: eggs, pan: pan)
    dish.cookScrambledEggs()
    
    // MARK: #3
    
    enum Ingredient: String {
        case bread, butter, jam
    }
    
    class Sandwich {
        var ingredients: [Ingredient]
        
        func makeSandwich() {
            let texted = ingredients.map { $0.rawValue }
            let reduced = texted.reduce("") { $0 + " " + $1 }
            print("Бутерброд из:\(reduced) готов!")
        }
        
        init(ingredients: [Ingredient]) {
            self.ingredients = ingredients
        }
    }
    
    let mySandwich = Sandwich(ingredients: [.bread, .butter, .jam])
    mySandwich.makeSandwich()
    
}
