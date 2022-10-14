//
//  Ship.swift
//  Manex
//
//  Created by michaelyangqianlong on 10/10/22.
//

import Foundation
import SpriteKit

class Ship: SKSpriteNode {
    
    // To implement:
    // LinkedList data structure
    // Checks to calculate which tactical diameter is greater between two ships
    // Enum for 3 types of ships
    
    var standardDistance: Int = 0
    var manoeuvringInterval: Int = 0
    var id: Int = 0
    var isDivGuide: Bool = false
    
    init(imageNamed: String, sd: Int, mi: Int, id: Int) {
        let texture = SKTexture(imageNamed: "warship_large_v2")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        self.standardDistance = sd
        self.manoeuvringInterval = mi
        self.id = id
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
