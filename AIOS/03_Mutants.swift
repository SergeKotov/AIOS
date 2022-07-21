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

/*
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
*/

