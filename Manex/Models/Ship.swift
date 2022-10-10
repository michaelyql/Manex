//
//  Ship.swift
//  Manex
//
//  Created by michaelyangqianlong on 10/10/22.
//

import Foundation
import SpriteKit

class Ship: SKSpriteNode {
    var tacticalDiameter: CGFloat?
    var manoeuvringInterval: CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tacticalDiameter = CGFloat(bitPattern: 100)
    }
}
