//
//  main.swift
//  AIOS
//
//  Created by Serge Kotov on 15.07.2022.
//

import Foundation


var isGaming = true
while isGaming {
    do {
        try DungeonAndErrors().run()
        
        // catch 'errors'
    } catch is DungeonError {
        print("You lose")
    } catch DungeonPrize.princeOrPrincess {
        print("You saved the prince / princess.")
    } catch GameError.indexOut {
        print(GameError.indexOut.rawValue)
    } catch GameError.illegalInput {
        print(GameError.illegalInput.rawValue)
    }
    
    print("Would you like to play the next game? [Y, N]")
    let answer = readLine()?.uppercased() ?? ""
    if answer != "Y" {
        isGaming = false
    }
}

print("Goodbye\n")
