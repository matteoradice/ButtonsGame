//
//  GameKeeper.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 06/09/21.
//

import UIKit

class GameKeeper {
    
    func updateStatus(difficultyLevel: Int, suggestions: Int = 0) -> [UIImage] {
        updateMoves()
        updateLevels()
        updateSuggestions(suggestions: suggestions)
        return updateStars(difficultyLevel: difficultyLevel)
    }
    
    private func updateMoves() {
        K.move += 1
        print("MOVE \(K.move)")
    }
    
    private func updateLevels() {
        K.level += 1
    }
    
    private func updateSuggestions(suggestions: Int = 0) {
        K.suggestion = K.suggestion + suggestions
    }
    
    private func updateStars(difficultyLevel: Int) -> [UIImage]{
        var images: [UIImage] = []
        
        let thresholdZeroStars: Int = difficultyLevel * 4
        let thresholdOneStar: Int = difficultyLevel * 3
        let thresholdTwoStars: Int = difficultyLevel * 2
        let thresholdThreeStars: Int = difficultyLevel
        
        if K.move <= thresholdThreeStars {
            images = [K.filledStar, K.filledStar, K.filledStar]
        } else if K.move > thresholdThreeStars && K.move <= thresholdTwoStars {
            images = [K.filledStar, K.filledStar, K.emptyStar]
        } else if K.move > thresholdTwoStars && K.move <= thresholdOneStar {
            images = [K.filledStar, K.emptyStar, K.emptyStar]
        } else {
            images = [K.emptyStar, K.emptyStar, K.emptyStar]
        }
        return images
    }
    
}
