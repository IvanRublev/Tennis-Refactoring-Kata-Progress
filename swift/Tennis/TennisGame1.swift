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
    private var score1 = Score()
    private var score2 = Score()
    private let scores: [String : Score]
    
    required init(player1: String, player2: String) {
        self.player1 = player1
        self.player2 = player2

        var scores = [String : Score]()
        scores[player1] = score1
        scores[player2] = score2
        self.scores = scores
    }

    func wonPoint(_ playerName: String) {
        scores[playerName]?.plusPoint()
    }
    
    var score: String? {
        if score1 == score2 {
            return nameOfEqualScore()
        }
        else if score1.isAfter4PointGame || score2.isAfter4PointGame {
            return nameOfGreaterThenFourScore()
        }
        else {
            return nameOfLessThenFourScore()
        }
    }
    
    private func nameOfEqualScore() -> String {
        let score = score1.equalName
        return score
    }
    
    private func nameOfGreaterThenFourScore() -> String {
        let advantage = advantageName()
        let leadingPlayer = leadingPlayerName()
        let score = "\(advantage) \(leadingPlayer)"
        return score
    }
    
    private func advantageName() -> String {
        let diff = score1.absoluteAdvantage(for: score2)
        if diff == 1 {
            return "Advantage"
        }
        else {
            return "Win for"
        }
    }
    
    private func leadingPlayerName() -> String {
        let leadingPlayer: String

        if score1 > score2 {
            leadingPlayer = player1
        }
        else if score1 < score2 {
            leadingPlayer = player2
        }
        else {
            leadingPlayer = "none"
        }
        
        return leadingPlayer
    }
    
    private func nameOfLessThenFourScore() -> String {
        let score = "\(score1.name)-\(score2.name)"
        return score
    }
}
