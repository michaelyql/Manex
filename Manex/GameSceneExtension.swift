//
//  GameSceneExtension.swift
//  Manex
//
//  Created by michaelyangqianlong on 21/10/22.
//

import SpriteKit

// Functions for adding/removing/generating formations stored here
extension GameScene {
    
    /* To be refactored to allow user to pick which type of ship to add first before adding the ship */
    func addShipToColummn() {
        let newShip = Ship(shipType: .large, prev: lastShip)
        lastShip.nextShip = newShip
        newShip.position = CGPoint(x: lastShip.position.x, y: lastShip.position.y - CGFloat(lastShip.standardDistance))
        guard newShip.id <= 8 else { return }
        addChild(newShip)
        lastShip = newShip
    }
    
    func removeShipFromColumn() {
        guard lastShip.id > 1 else { return }
        lastShip.removeFromParent()
        if let previousShip = lastShip.previousShip {
            previousShip.nextShip = nil
            lastShip = previousShip
        }
    }
    
    func formation1() {
        addShipToColummn()
        if lastShip.id < 8 {
            formation1()
        } else { return }
    }
    
    func formation2() {}
    func formation3() {}
    func formation4() {}
    func formation5() {}
    func formation6() {}
    func formation7() {}
    func formation8() {}
    func formation9() {}
    func formation10() {}
    func formation11() {}
    func formation12() {}
}
