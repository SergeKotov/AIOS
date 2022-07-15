//
//  main.swift
//  AIOS
//
//  Created by Serge Kotov on 15.07.2022.
//

let nim = Nim()
let players = [
    NimPlayer(name: "Steve", nim: nim),
    NimPlayer(name: "Bill", nim: nim),
]

let strangerThings = GameClub(players: players, game: nim)
strangerThings.runSeason()

