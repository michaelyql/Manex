//
//  SignalCollectionViewCell.swift
//  Manex
//
//  Created by michaelyangqianlong on 23/10/22.
//

import UIKit

class SignalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var button: UIButton!
    static let identifier = "signalCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with button: UIButton) {
        self.button = button
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SignalCollectionViewCell", bundle: nil)
    }
}
