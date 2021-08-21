//
//  MainScreenFramework.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 21/08/21.
//

import UIKit

struct MainScreenFramework {
    
    typealias CompletionHandler = (_ completed: Bool) -> ()
    
    var overarchingView: UIView = UIView()
    var topView: UIView = UIView()
    var middleView: UIView = UIView()
    var bottomView: UIView = UIView()
    
    private var shapeMargins: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    //  % of height referred to the overarching view occupied by top / middle / bottom views
    private var proportionsForHeight: [CGFloat] = [0.2, 0.6, 0.2]
    
    let controllerView: UIView
    init(controllerView: UIView = UIView()) {
        self.controllerView = controllerView
    }
    
    mutating func createVisualizationFramework(insetsSafeArea: UIEdgeInsets) {
        
        buildOverarchingView(insetsSafeArea: insetsSafeArea)
        buildTopView()
        buildMiddleView()
        buildBottomView()
                
    }
    
    private mutating func buildOverarchingView(insetsSafeArea: UIEdgeInsets) {
        let frame:CGRect = controllerView.frame.inset(by: insetsSafeArea)
        overarchingView = UIView(frame: frame)
        controllerView.addSubview(overarchingView)
        overarchingView.backgroundColor = .clear
    }
    
    
    private mutating func buildTopView() {
        
        let availableHeight: CGFloat = overarchingView.frame.height - (shapeMargins.top * 4)
        
        //  Position and size
        let x: CGFloat = shapeMargins.left
        let y: CGFloat = shapeMargins.top
        let width: CGFloat = overarchingView.frame.width - shapeMargins.left - shapeMargins.right
        let height: CGFloat = availableHeight * proportionsForHeight[0]
        let frame: CGRect = CGRect(x: x, y: y, width: width, height: height)
        
        // Initialize
        topView = UIView(frame: frame)
        
        // Display
        overarchingView.addSubview(topView)
        
        // Define attributes - Eg. color
        topView.backgroundColor = .clear
        
    }
    
    private mutating func buildMiddleView() {
        
        let availableHeight: CGFloat = overarchingView.frame.height - (shapeMargins.top * 4)
        
        //  Position and size
        let x: CGFloat = shapeMargins.left
        let y: CGFloat = shapeMargins.top + shapeMargins.top + topView.frame.height
        let width: CGFloat = overarchingView.frame.width - shapeMargins.left - shapeMargins.right
        let height: CGFloat = availableHeight * proportionsForHeight[1]
        let frame: CGRect = CGRect(x: x, y: y, width: width, height: height)
        
        // Initialize
        middleView = UIView(frame: frame)
        
        // Display
        overarchingView.addSubview(middleView)
        
        // Define attributes - Eg. color
        middleView.backgroundColor = .clear
                
    }
    
    private mutating func buildBottomView() {
        
        let availableHeight: CGFloat = overarchingView.frame.height - (shapeMargins.top * 4)
        
        //  Position and size
        let x: CGFloat = shapeMargins.left
        let y: CGFloat = shapeMargins.top + shapeMargins.top + topView.frame.height + shapeMargins.top + middleView.frame.height
        let width: CGFloat = overarchingView.frame.width - shapeMargins.left - shapeMargins.right
        let height: CGFloat = availableHeight * proportionsForHeight[2]
        let frame: CGRect = CGRect(x: x, y: y, width: width, height: height)
        
        // Initialize
        bottomView = UIView(frame: frame)
        
        // Display
        overarchingView.addSubview(bottomView)
        
        // Define attributes - Eg. color
        bottomView.backgroundColor = .clear
                
    }
    
}
