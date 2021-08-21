//
//  K.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 19/08/21.
//

import UIKit

enum GameType {
    case square
    case cross
}

enum DifficultyLevel {
    case hard
    case medium
    case easy
}

class K {
    
    // Variabili che incidono su Box
    static let activeColor: UIColor = .systemRed
    static let inactiveColor: UIColor = .systemGray
    
    // Variabili che incidono su Board
    static let rows: Int = 5
    static let columns: Int = 5
    
    // Variabili per disposizione della collectionview
    static let topMargin: CGFloat = 30
    static let leftMargin: CGFloat = 30
    static let insets: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    static let minimumSpacing: CGFloat = 5
    
    // Variabili che incidono su gameplay
    static let radius: Int = 1
    static let gameType: GameType = .cross
    static let difficulty: DifficultyLevel = .hard
    static var numberOfMovesForSolution: Int {
        switch difficulty {
        case .easy:
            return 5
        case .medium:
            return 10
        case .hard:
            return 15
        }
    }
    
}
