//
//  Score.swift
//  TennisTests
//
//  Created by Test on 08/10/2017.
//

import Foundation

class Score: Equatable, Comparable {
    private var value = 0
    
    func plusPoint() {
        value+=1
    }
    
    var name: String {
        let name: String
        
        switch value {
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
    
    var equalName: String {
        let equalName: String
        if 0...2 ~= value {
            equalName = "\(name)-All"
        }
        else {
            equalName = "Deuce"
        }
        return equalName
    }
    
    private func absoluteAdvantage(for score: Score) -> Int {
        let diff = abs(value-score.value)
        return diff
    }
    
    func advantageName(for score: Score) -> String? {
        let diff = self.absoluteAdvantage(for: score)
        if diff == 1 {
            return "Advantage"
        }
        else if diff > 1 {
            return "Win for"
        }
        else {
            return nil
        }
    }
    
    var isAfter4PointGame: Bool {
        return value >= 4
    }
}

// MARK: Equatable
extension Score {
    static func ==(lhs: Score, rhs: Score) -> Bool {
        return lhs.value == rhs.value
    }
}

// MARK: Comparable
extension Score {
    static func <(lhs: Score, rhs: Score) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func <=(lhs: Score, rhs: Score) -> Bool {
        return lhs.value <= rhs.value
    }
    
    static func >=(lhs: Score, rhs: Score) -> Bool {
        return lhs.value >= rhs.value
    }
    
    static func >(lhs: Score, rhs: Score) -> Bool {
        return lhs.value > rhs.value
    }
}
