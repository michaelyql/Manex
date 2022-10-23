//
//  FormationViewControllerExtension.swift
//  Manex
//
//  Created by michaelyangqianlong on 23/10/22.
//

import Foundation
import UIKit


extension GameViewController: UICollectionViewDelegate {
    // for handling taps on cells
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension GameViewController: UICollectionViewDataSource {
    // controls number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    // return cell for given item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignalCollectionViewCell.identifier, for: indexPath) as! SignalCollectionViewCell
        cell.configure(with: UIButton(type: .system))
        return cell
    }
}

//extension GameViewController: UICollectionViewDelegateFlowLayout {
//    control marging and padding for each cell
//}
