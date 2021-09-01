//
//  TopStackView.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 22/08/21.
//

import UIKit

struct TopViewManager {
    
    var levelLabel: UILabel = UILabel()
    var currentLevel: UILabel = UILabel()
    var settings: UIButton = UIButton()
    
    mutating func displayTopView(containingView: UIView) {
        
        //  Set the width of the three elements
        let availableSpace: CGRect = containingView.frame
        let widthProportions: [CGFloat] = [0.4, 0.4, 0.2]
        let levelLabelWidth = availableSpace.width * widthProportions[0]
        let currentLevelWidth = availableSpace.width * widthProportions[1]
        let settingsWidth = availableSpace.width * widthProportions[2]
        
        //  Set the height of the three elements
        let heightProportion: CGFloat = availableSpace.height * 0.5
        let levelLabelHeight: CGFloat = heightProportion
        let currentLevelHeight: CGFloat = heightProportion
        let settingsHeight: CGFloat = settingsWidth
        
        //  Set the anchor points
        let levelLabelX: CGFloat = 0
        let currentLevelX: CGFloat = levelLabelWidth
        let settingsX: CGFloat = levelLabelWidth + currentLevelWidth
        
        let levelLabelY: CGFloat = (availableSpace.height - levelLabelHeight) / 2
        let currentLevelY: CGFloat = (availableSpace.height - currentLevelHeight) / 2
        let settingsY: CGFloat = (availableSpace.height - settingsHeight) / 2
        
        levelLabel = UILabel(frame: CGRect(x: levelLabelX, y: levelLabelY, width: levelLabelWidth, height: levelLabelHeight))
        currentLevel = UILabel(frame: CGRect(x: currentLevelX, y: currentLevelY, width: currentLevelWidth, height: currentLevelHeight))
        settings = UIButton(frame: CGRect(x: settingsX, y: settingsY, width: settingsWidth, height: settingsHeight))
        
        containingView.addSubview(levelLabel)
        containingView.addSubview(currentLevel)
        containingView.addSubview(settings)
        
        levelLabel.text = "Level"
        currentLevel.text = "33"
        settings.setTitle("Settings", for: .normal)

        
        
    }
}
