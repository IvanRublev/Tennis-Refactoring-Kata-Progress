//
//  TennisGame1.swift
//  TennisTests
//
//  Created by Ivan Rublev on 07/10/2017.
//

import Foundation

class TennisGame1: TennisGame {
    private let player1: String
    private let player2: String
    private let scores: [String : Score]
    
    required init(player1: String, player2: String) {
        self.player1 = player1
        self.player2 = player2

        var scores = [String : Score]()
        scores[player1] = Score()
        scores[player2] = Score()
        self.scores = scores
    }

    func wonPoint(_ playerName: String) {
        scores[playerName]?.plusPoint()
    }
    
    var score: String? {
        if scores[player1]! == scores[player2]! {
            return nameOfEqualScore()
        }
        if scores.values.contains(where: { $0.isAfter4PointGame }) {
            return nameOfGreaterThenFourScore()
        }
        return nameOfLessThenFourScore()
    }
    
    private func nameOfEqualScore() -> String {
        let score = scores[player1]!.equalName
        return score
    }
    
    private func nameOfGreaterThenFourScore() -> String {
        let advantage = advantageName()
        let leadingPlayer = leadingPlayerName()
        let score = "\(advantage) \(leadingPlayer)"
        return score
    }
    
    private func advantageName() -> String {
        let diff = scores[player1]!.absoluteAdvantage(for: scores[player2]!)
        if diff == 1 {
            return "Advantage"
        }
        else {
            return "Win for"
        }
    }
    
    private func leadingPlayerName() -> String {
        let leadingPlayer: String

        if scores[player1]! > scores[player2]! {
            leadingPlayer = player1
        }
        else if scores[player1]! < scores[player2]! {
            leadingPlayer = player2
        }
        else {
            leadingPlayer = "none"
        }
        
        return leadingPlayer
    }
    
    private func nameOfLessThenFourScore() -> String {
        let score = "\(scores[player1]!.name)-\(scores[player2]!.name)"
        return score
    }
}
