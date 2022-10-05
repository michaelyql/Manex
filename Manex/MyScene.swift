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
        
        self.square = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 1, height: 1)))
        
        if let square = self.square {
            backgroundColor = SKColor.blue
            addChild(square)
        }
    }
}

