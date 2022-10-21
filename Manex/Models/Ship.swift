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
    // ID nested class - an SKSpriteNode to be rendered together with the ship
    // Division Guide flag symbol - to be rendered if ship is a division guide
    // Checks to calculate which tactical diameter is greater between two ships
    // Enum for 3 types of ships and Dynamically render their texture
    // Let user configure which type of ship to be part of the formation
    // Update ship function - allow user to change type of ship at any point of time 
    
    var previousShip: Ship?
    var nextShip: Ship?
    var standardDistance: Int = 0
    var id: Int = 0
    var isDivGuide: Bool = false
    
    init(shipType: ShipType, prev: Ship?=nil, next: Ship?=nil) {
        let texture = SKTexture(imageNamed: shipType.rawValue)
        super.init(texture: texture, color: .clear, size: texture.size())
        switch shipType {
        case .large:
            standardDistance = 200
        case .medium:
            standardDistance = 100
        case .small:
            standardDistance = 60
        }
        if let prev = prev {
            self.id = prev.id + 1
        }
        else {
            self.id = 1
        }
        self.previousShip = prev
        self.nextShip = next
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum ShipType: String {
    case large = "warship_large"
    case medium = "warship_medium"
    case small = "warship_small"
}
