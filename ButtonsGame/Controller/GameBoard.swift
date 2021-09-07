//
//  GameBoard.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 01/09/21.
//

import UIKit

class GameBoard: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
    let collectionLayoutManager: CollectionLayoutManager = CollectionLayoutManager()
    
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
        layout = collectionLayoutManager.calculateSizeForCollection(boardCollectionView: boardCollectionView)
        boardCollectionView.reloadData()
        boardCollectionView.isHidden = false
    }

}

//MARK: - UICollectionViewDataSource
extension GameBoard {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return K.rows * K.columns
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardCell", for: indexPath)
        cell.contentView.backgroundColor = board.buttonsInBoard[indexPath.row].color
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension GameBoard {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        board = clickManager.clickOnButton(board: board, button: board.buttonsInBoard[indexPath.row])
        solution = clickManager.verifyAndUpdateSolution(solution: solution, button: board.buttonsInBoard[indexPath.row])
        print("Updated solution \(solution)")
        collectionView.reloadData()
        print(clickManager.verifyGameStatus(board: board))
    }

}

//MARK: - UICollectionViewDelegateFlowLayout
extension GameBoard: UICollectionViewDelegateFlowLayout {
    
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
    
}

