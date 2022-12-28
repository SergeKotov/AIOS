import Foundation


print("Press number of session 1...9 to run relevant game or simulation:")

guard let num = Int(readLine() ?? "1") else {
    print("Press a number from 1 to 9")
    exit(66)
}

switch num {
case 1: nimGame()
case 2: MicroComputer().runOS()
case 22: candidatesSim()
case 3:
    let mc = MicroComp(ver: "3.0")
    mc.addProgram(name: "test", program: swiftTest)
    mc.runOS()
case 32: mutantBattle()
case 4: swiftTest()
case 5:
    let mc = ProComp(ver: "5.0")
    mc.addProgram(name: "test", program: swiftTest)
    mc.powerOn = true
case 6:
    let mc = FunComp(ver: "6.0")
    let dice = { "Throw the dice: 🎲 \(Int.random(in: 1...6))" }
    mc.upgrade(name: "dice", command: .voidToStr(dice))
    mc.upgrade(name: "upgrade", command: .computer(upgrade))
    mc.powerOn = true
case 7: literature()
case 8: startups()
case 9: try? dangeonsAndErrors()
default:
    print("Incorrect number. Press a number matched with a session number")
}

