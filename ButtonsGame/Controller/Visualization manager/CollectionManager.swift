//
//  CollectionManager.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 21/08/21.
//

import UIKit

struct CollectionManager {
    
    private struct LayoutSizes {
        var itemHeight: CGFloat = 0
        var itemWidth: CGFloat = 0
        var collectionHeight: CGFloat = 0
        var collectionWidth: CGFloat = 0
    }
        
    //  Metodo che restituisce i valori di "frame" e di "layout" della collection in funzione di una UIView contenitore passata come argomento - I valori sono restituiti in una tupla
    
    func calculateCollectionFeatures(collectionContainingView: UIView) -> (CGRect, UICollectionViewFlowLayout) {
        
        // Calcolo delle dimensioni complessive e degli item
        let layoutSizes: LayoutSizes = calculateItemSize(frame: collectionContainingView.frame)
        
        // Attribuzione a layoutflow
        let layoutFlow: UICollectionViewFlowLayout = calculateCollectionLayout(layoutSizes: layoutSizes)
        
        // Creazione frame
        let frame: CGRect = calculateCollectionPosition(collectionContainingView: collectionContainingView, layoutSizes: layoutSizes)
        
        return (frame, layoutFlow)
    }
    
    //  Calcolo posizione
    private func calculateCollectionPosition(collectionContainingView: UIView, layoutSizes: LayoutSizes) -> (CGRect) {
        let x: CGFloat = (collectionContainingView.frame.width - layoutSizes.collectionWidth) / 2
        let y: CGFloat = (collectionContainingView.frame.height - layoutSizes.collectionHeight) / 2
        let frame: CGRect = CGRect(x: x, y: y, width: layoutSizes.collectionWidth, height: layoutSizes.collectionHeight)
        return (frame)
    }
    
    //  Calcolo dei valori di layout
    private func calculateCollectionLayout(layoutSizes: LayoutSizes) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = K.insets
        layout.itemSize = CGSize(width: layoutSizes.itemWidth, height: layoutSizes.itemHeight)
        layout.minimumLineSpacing = K.minimumSpacing
        layout.minimumInteritemSpacing = K.minimumSpacing
        return layout
    }
    
    //  Calcolo delle dimensioni
    private func calculateItemSize(frame: CGRect) -> LayoutSizes {
        
        var itemHeight: CGFloat = 0
        var itemWidth: CGFloat = 0
        var collectionHeight: CGFloat = 0
        var collectionWidth: CGFloat = 0
        
        itemWidth = (frame.width - (K.insets.left + K.insets.right) - (CGFloat(K.columns - 1) * K.minimumSpacing)) / CGFloat(K.columns)
        itemHeight = (frame.height - (K.insets.top + K.insets.bottom) - (CGFloat(K.rows - 1) * K.minimumSpacing)) / CGFloat(K.rows)
        
        if itemWidth <= itemHeight { itemHeight = itemWidth }
        else { itemWidth = itemHeight }
        
        collectionHeight = (itemHeight * CGFloat(K.rows)) + (K.insets.top + K.insets.bottom) + (CGFloat(K.rows - 1) * K.minimumSpacing)
        collectionWidth = (itemWidth * CGFloat(K.columns)) + (K.insets.left + K.insets.right) + (CGFloat(K.columns - 1) * K.minimumSpacing)
        
        let layoutSizes = LayoutSizes(
            itemHeight: itemHeight,
            itemWidth: itemWidth,
            collectionHeight: collectionHeight,
            collectionWidth: collectionWidth)
        
        return layoutSizes
    }


    
}
