//
//  TennisGame1.swift
//  TennisTests
//
//  Created by Ivan Rublev on 07/10/2017.
//

import Foundation

class TennisGame1: TennisGame {
    private let player1: Player
    private let player2: Player
    private let players: [String : Player]
    private let scores: [String : Score]
    
    required init(player1: String, player2: String) {
        self.player1 = Player(name: player1)
        self.player2 = Player(name: player2)
        
        var players = [String : Player]()
        players[player1] = self.player1
        players[player2] = self.player2
        self.players = players

        var scores = [String : Score]()
        scores[player1] = self.player1.score
        scores[player2] = self.player2.score
        self.scores = scores
    }

    func wonPoint(_ playerName: String) {
        players[playerName]?.wonPoint()
    }
    
    var score: String? {
        if scores[player1.name]! == scores[player2.name]! {
            return nameOfEqualScore()
        }
        if scores.values.contains(where: { $0.isAfter4PointGame }) {
            return nameOfGreaterThenFourScore()
        }
        return nameOfLessThenFourScore()
    }
    
    private func nameOfEqualScore() -> String {
        let score = scores[player1.name]!.equalName
        return score
    }
    
    private func nameOfGreaterThenFourScore() -> String {
        let advantage = advantageName()
        let leadingPlayer = leadingPlayerName()
        let score = "\(advantage) \(leadingPlayer)"
        return score
    }
    
    private func advantageName() -> String {
        let name = player1.score.advantageName(for: player2.score) ?? ""
        return name
    }
    
    private func leadingPlayerName() -> String {
        let leadingPlayer = Player.leader(player1: player1, player2: player2)
        let name = leadingPlayer?.name ?? ""
        return name
    }
    
    private func nameOfLessThenFourScore() -> String {
        let score = "\(scores[player1.name]!.name)-\(scores[player2.name]!.name)"
        return score
    }
}
