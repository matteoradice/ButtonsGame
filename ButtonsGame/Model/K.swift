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
    
    //  Palette di colori
    static let color01 = UIColor(red: 0.44, green: 0.41, blue: 0.67, alpha: 1.00)
    static let color02 = UIColor(red: 0.58, green: 0.85, blue: 0.76, alpha: 1.00)
    static let color03 = UIColor(red: 1.00, green: 0.92, blue: 0.63, alpha: 1.00)
    static let color04 = UIColor(red: 0.99, green: 0.44, blue: 0.59, alpha: 1.00)
    
    // Variabili che incidono su Box
    static let activeColor: UIColor = color01
    static let inactiveColor: UIColor = color02
    
    // Variabili che incidono su Board
    static let rows: Int = 5
    static let columns: Int = 5
    
    // Variabili per disposizione della collectionview
    static let insets: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    static let minimumSpacing: CGFloat = 5
    
    // Variabili che incidono su gameplay
    static let radius: Int = 1
    static let gameType: GameType = .cross
    static let difficulty: DifficultyLevel = .easy
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
    
    //  Variabili che definiscono il layout della topView
    //  Dimensione del bottone settings
    static let buttonWidth: CGFloat = 100
    static let buttonHeight: CGFloat = 100
    
}
