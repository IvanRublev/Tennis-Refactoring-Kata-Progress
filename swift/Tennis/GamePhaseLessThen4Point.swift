//
//  GamePhaseLessThen4Point.swift
//  TennisTests
//
//  Created by Test on 08/10/2017.
//

import Foundation

class GamePhaseLessThen4Point: GamePhase {
    private let score1: Score
    private let score2: Score
    
    init(score1: Score, score2: Score) {
        self.score1 = score1
        self.score2 = score2
    }
    
    var scoresDescription: String {
        return ""
    }
}
