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
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    var scoresDescription: String {
        return ""
    }
}
