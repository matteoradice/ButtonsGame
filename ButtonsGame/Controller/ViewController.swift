//
//  ViewController.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 19/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    var board: Board = Board()
    var originalBoard: Board = Board()
    var solution: [Int] = []
    var originalSolution: [Int] = []
    
    let clickManager: ClickManager = ClickManager()
    let collectionManager: CollectionManager = CollectionManager()
    var mainScreenFramework: MainScreenFramework = MainScreenFramework()
    
    var boardCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Inizializzazione del tabellone di gioco
        board.initializeBoard()
        let boardAndSolution: (Board, [Int]) = clickManager.createSchemaToSolve(board: board)
        board = boardAndSolution.0
        originalBoard = board
        solution = boardAndSolution.1
        originalSolution = solution
        
    }
    
    override func viewDidLayoutSubviews() {
        
        //  Creazione e visualizzazione del framework di viste
        let safeAreaInsets: UIEdgeInsets = self.view.safeAreaInsets
        mainScreenFramework = MainScreenFramework(controllerView: self.view)
        mainScreenFramework.createVisualizationFramework(insetsSafeArea: safeAreaInsets)
        
        //  Inserimento della collectionView dentro a middleView
        let collectionFeatures = collectionManager.calculateCollectionFeatures(collectionContainingView: mainScreenFramework.middleView)
        let collectionFrame = collectionFeatures.0
        let collectionLayout = collectionFeatures.1
        boardCollectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: collectionLayout)
        
        //  Registrazione delle celle
        boardCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BoardCell")
        
        
        //  Delegati della collection
        boardCollectionView?.delegate = self
        boardCollectionView?.dataSource = self
        
        
        // Visualizzazione della collection
        mainScreenFramework.middleView.addSubview(boardCollectionView ?? UICollectionView())
        boardCollectionView?.backgroundColor = .clear
    
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
        solution = clickManager.verifyAndUpdateSolution(solution: solution, button: board.buttonsInBoard[indexPath.row])
        print("Updated solution \(solution)")
        collectionView.reloadData()
        print(clickManager.verifyGameStatus(board: board))
    }
    
}
