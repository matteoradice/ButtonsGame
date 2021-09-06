//
//  GameBoard.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 01/09/21.
//

import UIKit

class GameBoard: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var containerViewForCollection: UIView!
    @IBOutlet weak var boardCollectionView: UICollectionView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var firstStarImage: UIImageView!
    @IBOutlet weak var secondStarImage: UIImageView!
    @IBOutlet weak var thirdStarImage: UIImageView!
    
    let clickManager: ClickManager = ClickManager()
    var board: Board = Board()
    var originalBoard: Board = Board()
    var solution: [Int] = []
    var originalSolution: [Int] = []
    
    var layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        board.initializeBoard()
        let boardAndSolution: (Board, [Int]) = clickManager.createSchemaToSolve(board: board)
        board = boardAndSolution.0
        originalBoard = board
        solution = boardAndSolution.1
        originalSolution = solution
        
        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
        
        containerViewForCollection.backgroundColor = .clear
        boardCollectionView.backgroundColor = .clear

        boardCollectionView.isHidden = true
        
    }
    
    override func viewDidLayoutSubviews() {
        calculateSizeForCollection()
        boardCollectionView.reloadData()
        boardCollectionView.isHidden = false
    }
    
    func calculateSizeForCollection() {
        
        let availableHeight = boardCollectionView.frame.height
        let availableWidth = boardCollectionView.frame.width
        
        let numberOfRows: CGFloat = CGFloat(K.rows)
        let numberOfColumns: CGFloat = CGFloat(K.columns)
        
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 5.0
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let heightForItems: CGFloat = availableHeight - layout.sectionInset.top - layout.sectionInset.bottom - (layout.minimumLineSpacing * (numberOfRows - 1))
        let widthForItems: CGFloat = availableWidth - layout.sectionInset.left - layout.sectionInset.right - (layout.minimumInteritemSpacing * (numberOfColumns - 1))
        
        var itemHeight: CGFloat = heightForItems / numberOfRows
        var itemWidth: CGFloat = widthForItems / numberOfColumns
        
        if itemHeight <= itemWidth { itemWidth = itemHeight }
        else { itemHeight = itemWidth }
        
        layout.itemSize.width = itemWidth
        layout.itemSize.height = itemHeight
        
        let actuallyUsedHeight: CGFloat = layout.itemSize.height * numberOfRows + (layout.minimumLineSpacing * (numberOfRows - 1))
        let actuallyUsedWidth: CGFloat = layout.itemSize.width * numberOfColumns + (layout.minimumInteritemSpacing * (numberOfColumns - 1))
        
        layout.sectionInset = UIEdgeInsets(
            top: (availableHeight - actuallyUsedHeight) / 2,
            left: (availableWidth - actuallyUsedWidth) / 2,
            bottom: (availableHeight - actuallyUsedHeight) / 2,
            right: (availableWidth - actuallyUsedWidth) / 2
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return layout.sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return layout.itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return layout.minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return layout.minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return K.rows * K.columns
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardCell", for: indexPath)
        cell.contentView.backgroundColor = board.buttonsInBoard[indexPath.row].color
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        board = clickManager.clickOnButton(board: board, button: board.buttonsInBoard[indexPath.row])
        solution = clickManager.verifyAndUpdateSolution(solution: solution, button: board.buttonsInBoard[indexPath.row])
        print("Updated solution \(solution)")
        collectionView.reloadData()
        print(clickManager.verifyGameStatus(board: board))
        print(containerViewForCollection.frame)
    }
    
}

