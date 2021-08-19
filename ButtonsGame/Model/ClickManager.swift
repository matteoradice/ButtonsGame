//
//  ClickManager.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 19/08/21.
//

import UIKit

struct ClickManager {
    
    // Metodo che verifica se il gioco si è concluso e con che esito
    func verifyGameStatus(board: Board) -> Bool {
        var howManyActive: Int = 0
        for i in board.buttonsInBoard {
            if i.active == false { howManyActive += 1 }
            else { howManyActive += 0 }
        }
        if howManyActive == board.buttonsInBoard.count { return true }
        else { return false }
    }
    
    // Metodo per cambiare stato al box
    func changeStatusToButton(board: Board, button: Button) -> Board {
        var myButton = button
        var myBoard = board
        
        // Attributi del bottone da cambiare
        myButton.active = !myButton.active
        if myButton.active == true { myButton.color = K.activeColor }
        else { myButton.color = K.inactiveColor }
        
        // Update della board con bottone aggiornato
        myBoard.buttonsInBoard[myButton.buttonId].active = myButton.active
        myBoard.buttonsInBoard[myButton.buttonId].color = myButton.color
        
        return myBoard
    }

    // Metodo di verifica sul box cliccato e su tutti i box adiacenti
    func clickOnButton(board: Board, button: Button) -> Board {
        
        var myBoard: Board = board
        
        // 1. identify the buttons to change
                
        let lowRowsRange: Int = button.row - K.radius
        let highRowsRange: Int = button.row + K.radius
        let lowColumnsRange: Int = button.column - K.radius
        let highColumnsRange: Int = button.column + K.radius
        
        var arrayOfCells: [(Int, Int)] = []
        
        for row in lowRowsRange...highRowsRange {
            for column in lowColumnsRange...highColumnsRange {
                arrayOfCells.append((row, column))
            }
        }
                
        // 2. exclude the non-existing buttons
        var correctArrayOfCells: [Int] = []
        switch K.gameType {
        case .square:
            for i in board.buttonsInBoard {
                for x in arrayOfCells {
                    if (i.row, i.column) == x { correctArrayOfCells.append(i.buttonId) }
                }
            }
        case .cross:
            for i in board.buttonsInBoard {
                for x in arrayOfCells {
                    if (i.row, i.column) == x && (i.row == button.row || i.column == button.column) { correctArrayOfCells.append(i.buttonId) }
                    }
                }
            }
        
        
                
        // 3. change the status to the buttons
        for i in correctArrayOfCells {
            myBoard = changeStatusToButton(board: myBoard, button: board.buttonsInBoard[i])
        }
        
        // 4. return the updated board
        return myBoard
    }
    
}
