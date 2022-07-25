//
//  main.swift
//  AIOS
//
//  Created by Serge Kotov on 15.07.2022.
//

var counter = 1
var wrongAnswers = 0

print("Welcome to the Dream Company Greenhorn Swift developer test!")

while counter < 10, wrongAnswers < 4 {
    print("\n\n> Round \(counter)\n")

    print(guess[counter].value.0)
    print(guess[counter].value.1)
    print("\n> What will be printed?")

    let guessAnswer = guess[counter].value.2
    let answer = readLine()?.lowercased()
                            .trimmingCharacters(in: .whitespacesAndNewlines)
    if answer == guessAnswer {
        print(GoodAnswer.allCases.randomElement()!.rawValue)
    } else {
        wrongAnswers += 1
        print("Wrong, the right answer is: '\(guessAnswer)'")
    }
    let _ = readLine()
    
    counter += 1
}

// check test result
print("\nYour result is \(counter - wrongAnswers) from \(counter)")
switch wrongAnswers {
case 0...2:
    print("Excellent! Welcome to the board!")
case 3...4:
    print("Try once more in next year.")
default:
    print("👺")
}
print("\n")

