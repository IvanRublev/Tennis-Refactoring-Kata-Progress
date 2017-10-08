//
//  GamePhaseAfter4Point.swift
//  TennisTests
//
//  Created by Test on 08/10/2017.
//

import Foundation

class GamePhaseAfter4Point: GamePhase {
    private let player1: Player
    private let player2: Player
    private let score1: Score
    private let score2: Score
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.score1 = player1.score
        self.score2 = player2.score
    }
    
    var scoresDescription: String {
        let advantage = advantageName()
        let leadingPlayer = leadingPlayerName()
        let score = "\(advantage) \(leadingPlayer)"
        return score
    }
    
    private func advantageName() -> String {
        let name = score1.advantageName(for: score2) ?? ""
        return name
    }
    
    private func leadingPlayerName() -> String {
        let leadingPlayer = Player.leader(player1: player1, player2: player2)
        let name = leadingPlayer?.name ?? ""
        return name
    }
}
