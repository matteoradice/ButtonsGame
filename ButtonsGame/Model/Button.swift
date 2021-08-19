//
//  Button.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 19/08/21.
//

import UIKit

// Struct che rappresenta un box all'interno della schermata
struct Button {
    
    // Variabile che definisce se il box è illuminato (true) o spento (false)
    var active: Bool = false
    // Variabili che contengono le coordinate del box
    var row: Int = 0
    var column: Int = 0
    var buttonId: Int = 0
    // Variabile che definisce il colore di visualizzazione del box
    var color: UIColor = K.inactiveColor
}
