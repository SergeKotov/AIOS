//
//  main.swift
//  AIOS
//
//  Created by Serge Kotov on 15.07.2022.
//

let nim = Nim()

let players = [
    NimPlayer(name: "Steve"),
    NimPlayer(name: "Bill"),
    NimPlayer(name: "Kelly"),
]

let strangerThings = GameClub(players: players)
strangerThings.runSeason()

