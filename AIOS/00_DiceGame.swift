//
//  00_DiceGame.swift
//  AIOS
//
//  Created by Serge Kotov on 16.02.2023.
//

// MARK: Dice game, enter: `diceGame()` to run

let diceGame = {
    // Пример кода на языке Swift - игра в кости
    print("Игра в кости\n")

    // функция, возвращающая целое число от 1 до 6
    func dice() -> Int {
        Int.random(in: 1...6)
    }
    
    // переменные - целые числа
    var steveScore = 0
    var billScore = 0
    
    // цикл от 1 до 3
    for i in 1...3 {
        // интеграция целого числа в строку и ее печать
        print("Раунд \(i)")
        
        // вызов функции - получить очки от броска кубика
        let steveDice = dice()
        // печать результата
        print("Cтив получил \(steveDice) очков")
        // добавление очков к счету Стива
        steveScore += steveDice
        
        // те же операции для Билла
        let billDice = dice()
        print("Билл получил \(billDice) очков")
        billScore += billDice
    }
    
    // печать пустой строки
    print()
    
    // сравнение итогового счета и печать результата игры
    if steveScore > billScore {
        print("Стив выиграл!")
    } else if steveScore < billScore{
        print("Билл выиграл!")
    } else {
        print("Ничья!")
    }
}
