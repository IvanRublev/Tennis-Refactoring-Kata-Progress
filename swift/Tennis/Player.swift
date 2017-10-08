//
//  Player.swift
//  TennisTests
//
//  Created by Test on 08/10/2017.
//

import Foundation

class Player {
    let name: String
    let score = Score()
    
    class func leader(player1: Player, player2: Player) -> Player? {
        if player1.isLeading(for: player2) {
            return player1
        }
        else if player2.isLeading(for: player1) {
            return player2
        }
        else {
            return nil
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func isLeading(for otherPlayer: Player) -> Bool {
        return score > otherPlayer.score
    }
    
    func wonPoint() {
        score.plusPoint()
    }
}
