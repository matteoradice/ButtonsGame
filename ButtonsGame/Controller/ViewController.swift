//
//  ViewController.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 19/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    var board: Board = Board()
    var solution: [Int] = []
    
    let clickManager: ClickManager = ClickManager()
    
    var boardCollectionView: UICollectionView?
    var frame: CGRect = CGRect()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frame = calculateCollectionPositionAndSize()
        let layout = calculateCollectionLayout()
        
        boardCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        board.initializeBoard()
        let boardAndSolution: (Board, [Int]) = clickManager.createSchemaToSolve(board: board)
        board = boardAndSolution.0
        solution = boardAndSolution.1
        registerCell()
        
        boardCollectionView?.delegate = self
        boardCollectionView?.dataSource = self
        
        view.addSubview(boardCollectionView ?? UICollectionView())
        boardCollectionView?.reloadData()
        
    }
    
    func calculateCollectionPositionAndSize() -> CGRect {
        var x: CGFloat = 0
        var y: CGFloat = 0
        var width: CGFloat = 0
        var height: CGFloat = 0
        x = view.frame.minX + K.leftMargin
        y = view.frame.minY + K.topMargin
        width = view.bounds.width - (K.leftMargin * 2)
        height = view.bounds.height - (K.topMargin * 2)
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func calculateCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemSize = calculateItemSize()
        layout.sectionInset = K.insets
        layout.itemSize = CGSize(width: itemSize.0, height: itemSize.1)
        layout.minimumLineSpacing = K.minimumSpacing
        layout.minimumInteritemSpacing = K.minimumSpacing
        return layout
    }
    
    private func calculateItemSize() -> (CGFloat, CGFloat) {
        
        var height: CGFloat = 0
        var width: CGFloat = 0
        
        width = (frame.width - (K.insets.left + K.insets.right) - (CGFloat(K.columns - 1) * K.minimumSpacing)) / CGFloat(K.columns)
        height = (frame.height - (K.insets.top + K.insets.bottom) - (CGFloat(K.rows - 1) * K.minimumSpacing)) / CGFloat(K.rows)
        
        if width <= height { height = width }
        else { width = height }
        
        return (width, height)
    }
    
    func registerCell() {
        boardCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BoardCell")
    }
    
}

//MARK: - UICollectionDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return K.rows * K.columns
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardCell", for: indexPath)
            
        
        cell.backgroundColor = board.buttonsInBoard[indexPath.row].color
        return cell
    }
}

//MARK: - Click on cells

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        board = clickManager.clickOnButton(board: board, button: board.buttonsInBoard[indexPath.row])
        collectionView.reloadData()
        print(clickManager.verifyGameStatus(board: board))
    }
    
    
}

