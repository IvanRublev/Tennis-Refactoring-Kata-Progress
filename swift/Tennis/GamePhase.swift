//
//  GamePhase.swift
//  TennisTests
//
//  Created by Test on 08/10/2017.
//

import Foundation

func gamePhase(player1: Player, player2: Player) -> GamePhase {
    if player1.isEqualScore(for: player2) {
        return GamePhaseEqualScore(score: player1.score)
    }
    else if player1.isAfter4PointGame() || player2.isAfter4PointGame() {
        return GamePhaseAfter4Point(player1: player1, player2: player2)
    }
    else {
        return GamePhaseLessThen4Point(score1: player1.score, score2: player2.score)
    }
}

protocol GamePhase {
    var scoresDescription: String { get }
}

