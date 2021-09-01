//
//  GameBoard.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 01/09/21.
//

import UIKit

class GameBoard: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var containerViewForCollection: UIView!
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
    }
    
    override func viewDidLayoutSubviews() {
        let frame: CGRect = calculateSizeForCollection()
        let boardCollectionView: UICollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        boardCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BoardCell")
        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
        containerViewForCollection.addSubview(boardCollectionView)
        containerViewForCollection.backgroundColor = .clear
        boardCollectionView.backgroundColor = .clear
    }
    
    func calculateSizeForCollection() -> CGRect {
        let frame: CGRect = containerViewForCollection.frame
        var padding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let insets: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let minimumSpacing: CGFloat = 5.0
        let numberOfRows: CGFloat = CGFloat(K.rows)
        let numberOfColumns: CGFloat = CGFloat(K.columns)
        let availableHeight: CGFloat = frame.height - padding.top - padding.bottom
        let availableWidth: CGFloat = frame.width - padding.left - padding.right
        var itemHeight: CGFloat = (availableHeight - insets.top - insets.bottom - (minimumSpacing * (numberOfRows - 1))) / numberOfRows
        var itemWidth: CGFloat = (availableWidth - insets.left - insets.right - (minimumSpacing * (numberOfColumns - 1))) / numberOfColumns
        print("Available width \(availableWidth)")
        print("Insets left and right \(insets.left), \(insets.right)")
        print("Minimum spacing \(minimumSpacing)")
        print("NumberOfColumns \(numberOfColumns)")
        if itemHeight <= itemWidth { itemWidth = itemHeight }
        else { itemHeight = itemWidth }
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        print("ItemSize \(layout.itemSize)")
        layout.sectionInset = insets
        layout.minimumLineSpacing = minimumSpacing
        layout.minimumInteritemSpacing = minimumSpacing
        let usedHeight: CGFloat = (itemHeight * numberOfRows) + (minimumSpacing * (numberOfRows - 1)) + insets.top + insets.bottom
        let usedWidth: CGFloat = (itemWidth * numberOfColumns) + (minimumSpacing * (numberOfColumns - 1)) + insets.left + insets.right
        let x: CGFloat = (frame.width - usedWidth) / 2
        let y: CGFloat = (frame.height - usedHeight) / 2
        padding = UIEdgeInsets(top: y, left: x, bottom: y, right: x)
        let collectionViewFrame: CGRect = CGRect(x: padding.left, y: padding.top, width: usedWidth, height: usedHeight)
        return collectionViewFrame
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
        
    }
    
    
    @IBAction func menuButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func helpButtonPressed(_ sender: UIButton) {
    }
    
    func calculateSizes() {
        
    }
    
}
