//
//  GameScene.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let baseShip = SKSpriteNode(imageNamed: "ship")

    override var isUserInteractionEnabled: Bool {
        get {
            return true
        }
        set {
            // ignore
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .white
        baseShip.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(baseShip)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addShip()
    }
    
    // Function to add ship
    func addShip() {
        let newShip = SKSpriteNode(imageNamed: "ship")
        newShip.position = CGPoint(x: baseShip.position.x, y: baseShip.position.y - 50)
        addChild(newShip)
    }
}
