//
//  GamePhaseEqualScore.swift
//  TennisTests
//
//  Created by Test on 08/10/2017.
//

import Foundation

class GamePhaseEqualScore: GamePhase {
    private let score: Score
    
    init(score: Score) {
        self.score = score
    }
    
    var scoresDescription: String {
        return score.equalName
    }
}
