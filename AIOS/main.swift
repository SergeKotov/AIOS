import Foundation


print("Press number of session 1...9 to run relevant game or simulation:")

guard let num = Int(readLine() ?? "1") else {
    print("Press a number from 1 to 9")
    exit(66)
}

switch num {
case 1: nimGame()
case 2: MicroComputer().runOS()
case 3: print("The world of mutants:"); mutantBattle()
case 4: swiftTest()
case 5: Computer().powerOn = true
case 6: funComputer()
case 7: literature()
case 8: startups()
case 9: try? dangeonsAndErrors()
default:
    print("Incorrect number. Press a digit from 1 to 9")
}

