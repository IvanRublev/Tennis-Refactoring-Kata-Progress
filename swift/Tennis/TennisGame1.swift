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
    private var score1: Int = 0
    private var score2: Int = 0
    
    required init(player1: String, player2: String) {
        self.player1 = player1
        self.player2 = player2
    }

    func wonPoint(_ playerName: String) {
        if playerName == "player1" {
            score1 += 1
        }
        else {
            score2 += 1
        }
    }
    
    var score: String? {
        if score1 == score2 {
            return nameOfEqualScore()
        }
        else if score1 >= 4 || score2 >= 4 {
            return nameOfGreaterThenFourScore()
        }
        else {
            return nameOfLessThenFourScore()
        }
    }
    
    private func nameOfEqualScore() -> String {
        var score = ""
        
        if 0...2 ~= score1 {
            let name = standardName(for: score1)
            score = "\(name)-All"
        }
        else {
            score = "Deuce"
        }

        return score
    }
    
    private func standardName(for score: Int) -> String {
        let name: String
        
        switch score {
        case 0:
            name = "Love"
            
        case 1:
            name = "Fifteen"
            
        case 2:
            name = "Thirty"
            
        case 3:
            name = "Forty"
            
        default:
            fatalError("No name for score greater then 3.")
        }
        
        return name
    }
    
    private func nameOfGreaterThenFourScore() -> String {
        let advantage = advantageName()
        let leadingPlayer = leadingPlayerName()
        let score = "\(advantage) \(leadingPlayer)"
        return score
    }
    
    private func advantageName() -> String {
        let diff = abs(score1-score2)
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
        var score = ""
        var tempScore = 0
        for i in 1..<3 {
            if i == 1 {
                tempScore = score1
            }
            else {
                score = "\(score)-"
                tempScore = score2
            }
            let tempScoreName = standardName(for: tempScore)
            score = "\(score)\(tempScoreName)"
        }
        return score
    }
}
