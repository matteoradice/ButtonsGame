//
//  CollectionLayoutManager.swift
//  ButtonsGame
//
//  Created by Matteo Radice on 06/09/21.
//

import UIKit

struct CollectionLayoutManager {
    
    func calculateSizeForCollection(boardCollectionView: UICollectionView) -> UICollectionViewFlowLayout {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
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
        
        
        //  Check del layout
        print("Total size of the collection: width \(availableWidth) and height \(availableHeight) ")
        print("Internal spacing vs the containing view: top \(layout.sectionInset.top) and left \(layout.sectionInset.left)")
        print("Item size: width \(layout.itemSize.width) and height \(layout.itemSize.height)")
        print("Spacing btw rows \(layout.minimumLineSpacing) and columns \(layout.minimumInteritemSpacing)")
        print("Total actual allocated space for the collection: width \(actuallyUsedWidth) and height\(actuallyUsedHeight)")
        
        return layout
        
    }
    
    
}
