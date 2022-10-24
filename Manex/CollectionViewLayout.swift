//
//  CollectionViewLayout.swift
//  Manex
//
//  Created by michaelyangqianlong on 24/10/22.
//

import UIKit

class SignalCollectionViewLayout: UICollectionViewLayout {
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 240, height: 240)
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesList = [UICollectionViewLayoutAttributes]()
        
        return attributesList
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        return attr
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        <#code#>
    }
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        <#code#>
    }
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        <#code#>
    }
}
