//
//  MyScene.swift
//  Manex
//
//  Created by michaelyangqianlong on 4/10/22.
//

import SpriteKit
import GameplayKit

class MyScene: SKScene {
    
    private var square: SKShapeNode?
    
    // this method is called when a scene is presented to a view
    // so you should override this method for every scene 
    override func didMove(to view: SKView) {
        
        self.square = self.childNode(withName: "//SKShapeNode") as? SKShapeNode
        
        if let square = self.square {
            square.alpha = 0.0
            square.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
        }
        
    }
}

