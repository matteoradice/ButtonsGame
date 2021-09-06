//
//  GameKeeper.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 06/09/21.
//

import UIKit

class GameKeeper {
    
    var moves: Int = 0
    var level: Int = 0
    var suggestions: Int = 0
    var stars: Int = 0
    
    func updateStatus(difficultyLevel: Int, suggestions: Int = 0) {
        updateMoves()
        updateLevels()
        updateSuggestions(suggestions: suggestions)
        updateStars(difficultyLevel: difficultyLevel)
    }
    
    private func updateMoves() {
        moves += 1
    }
    
    private func updateLevels() {
        level += 1
    }
    
    private func updateSuggestions(suggestions: Int = 0) {
        self.suggestions = self.suggestions + suggestions
    }
    
    private func updateStars(difficultyLevel: Int) {
        var sensitivity: Float = 0.30
    // DA COMPLETARE
    }
    
}
