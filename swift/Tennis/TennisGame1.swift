//
//  TennisGame1.swift
//  TennisTests
//
//  Created by Ivan Rublev on 07/10/2017.
//

import Foundation

class TennisGame1: TennisGame {
    private let players: [Player]
    private let namesPlayers: [String : Player]
    
    required init(player1: String, player2: String) {
        players = [Player(name: player1), Player(name: player2)]
        
        var namesPlayers = [String : Player]()
        players.forEach { namesPlayers[$0.name] = $0 }
        self.namesPlayers = namesPlayers
    }

    func wonPoint(_ playerName: String) {
        namesPlayers[playerName]?.wonPoint()
    }
    
    var score: String? {
        let phase = gamePhase(player1: players.first!, player2: players.last!)
        return phase.scoresDescription
    }
}
