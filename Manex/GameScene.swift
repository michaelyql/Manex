//
//  GameScene.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var previousCameraPoint = CGPoint.zero
    var baseShip = SKSpriteNode(imageNamed: "warship_large_v2")

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
        
        // Camera movement
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGesture)
        
        baseShip.position = CGPoint(x: frame.midX, y: frame.midY)
        
        camera?.addChild(baseShip)
        
    
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       addShip()
    }
    
    // Function to add ship
    func addShip() {
        let newShip = SKSpriteNode(imageNamed: "warship_large_v2")
        newShip.position = CGPoint(x: baseShip.position.x, y: baseShip.position.y - 200)
        camera?.addChild(newShip)
        baseShip = newShip
    }
    
    // Camera movement
    @objc func panGestureAction(_ sender: UIPanGestureRecognizer) {
        // The camera has a weak reference, so test it
        guard let camera = self.camera else { return }
        
        // If the movement just began, save the first camera position
        if sender.state == .began {
            previousCameraPoint = camera.position
        }
        // Perform the translation
        let translation = sender.translation(in: self.view)
        let newPosition = CGPoint(x: previousCameraPoint.x + translation.x * -1, y: previousCameraPoint.y + translation.y)
        camera.position = newPosition
    }
}
