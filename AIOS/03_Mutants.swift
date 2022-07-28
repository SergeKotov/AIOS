//
//  03 The fiction battle with mutants
//  AIOS
//
//  Created by Serge Kotov on 19.07.2022.
//

public enum Shape: Int, CaseIterable {
    case ghost, zombie, vampire
    
    func versus(_ vs: Self) -> Outcome {
        let vs = self.rawValue - vs.rawValue
        switch vs {
        case 0:     return .draw
        case 1, -2: return .win
        default:    return .loss
        }
    }
}

public enum Outcome: Int {
    case draw, win, loss
}

class Agent {
    var shape = Shape.allCases.randomElement()!
    var lastOutcome = Outcome.draw
    
    private(set) var wins = 0
    private(set) var defeated = 0
    
    func act(versus: Agent) {
        battle(versus)
    }
    
    fileprivate func battle(_ rival: Agent) {
        lastOutcome = shape.versus(rival.shape)
        switch lastOutcome {
        case .win:
            self.wins += 1
            rival.defeated += 1
        case .loss:
            self.defeated += 1
            rival.wins += 1
        case .draw:
            break
        }
    }
}

// Create mutant agents

class SteadyAgent: Agent { }

class RandomAgent: Agent {

    override func act(versus: Agent) {
        shape = Shape.allCases.randomElement()!
        super.act(versus: versus)
    }
}

class LearningAgent: Agent {

    override func act(versus: Agent) {
        if lastOutcome == .loss {
            switch shape {
            case .ghost: shape = .zombie
            case .zombie: shape = .vampire
            case .vampire: shape = .ghost
            }
        }
        super.act(versus: versus)
    }
}

class AwakeningAgent: Agent {

    override func act(versus: Agent) {
        switch versus.shape {
        case .ghost: shape = .zombie
        case .zombie: shape = .vampire
        case .vampire: shape = .ghost
        }
        super.act(versus: versus)
    }
}


class AwareAgent: Agent {
    
    override func act(versus: Agent) {
        switch versus.shape {
        case .ghost: shape = .zombie
        case .zombie: shape = .vampire
        case .vampire: shape = .ghost
        }
        super.act(versus: versus)
    }
}

let mutantBattle = {
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
}

/*
 // Functional programming
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

