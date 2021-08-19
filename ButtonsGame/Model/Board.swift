//
//  Board.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 19/08/21.
//

import UIKit

// Struttura che rappresenta il tabellone di gioco
struct Board {
        
    // Array che contiene i box - Viene inizializzata con tutte celle spente quando istanziato Board
    var buttonsInBoard: [Button] = []
    

    mutating func initializeBoard() {
        var tempButton: Button = Button()
        var buttonId: Int = 0
        for row in 0..<K.rows {
            for column in 0..<K.columns {
                tempButton.row = row
                tempButton.column = column
                tempButton.buttonId = buttonId
                buttonId += 1
                buttonsInBoard.append(tempButton)
            }
        }
    }
}
