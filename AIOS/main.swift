//
//  main.swift
//  AIOS
//
//  Created by Serge Kotov on 15.07.2022.
//

// create agents
let agentCount = 1200
var agents: [Int: Agent] = [:]
agents.reserveCapacity(agentCount)
for id in 0..<agentCount {
    switch id % 3 {
    case 0: agents[id] = SteadyAgent()
    case 1: agents[id] = RandomAgent()
    default: agents[id] = LearningAgent()
    }
}

// run battle
var battleCount = 100_000
while battleCount > 0, agents.count > 1 {
    let first = agents.randomElement()!
    let second = agents.randomElement()!
    first.value.act(versus: second.value) // the first attacks

    // handle battle result
    if first.value.defeated > 3 {
        agents[first.key] = nil
    }
    if second.value.defeated > 3 {
        agents[second.key] = nil
    }

    battleCount -= 1
}

for winner in agents.values {
    print("Winner: \(winner.self) shape: \(winner.shape) wins: \(winner.wins) defeated: \(winner.defeated)")
}
print()


/*
let wordLog = ["GHbdtn", "Hello", nil, nil, "ПРювет"]

var upperWorlds: [String] = []
for word in wordLog {
    if word != nil {
        let WORD = word!.uppercased()
        upperWorlds.append(WORD)
    }
}

let filtered = wordLog.compactMap { $0?.uppercased() }
                      .filter { $0.first == "H"}

print(upperWorlds)
print(filtered)
print()
print()
*/
