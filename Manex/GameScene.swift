//
//  GameScene.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // To implement:
    // Show ship ID number next to / on top of ship
    // Add toggle button for 
    // func addShipToRow() {}
    // Button for addShip() function
    
    var previousCameraPoint = CGPoint.zero
    var baseShip = Ship(imageNamed: "warship_large_v2", sd: 150, mi: 150, id: 1)
    
    override var isUserInteractionEnabled: Bool {
        get {
            return true
        }
        set {}
    }
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        
        // Adding gesture recognizer for panning
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGesture)
        self.addChild(baseShip)
        baseShip.position = CGPoint(x: frame.midX, y: frame.midY)
        
    
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    // Overriding methods to allow the Scene and its nodes to respond to touch events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addShipToColummn()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    // Function to add ship
    func addShipToColummn() {
        let newShip = Ship(imageNamed: "warship_large_v2", sd: 150, mi: 150, id: 0)
        newShip.position = CGPoint(x: baseShip.position.x, y: baseShip.position.y - CGFloat(baseShip.standardDistance))
        newShip.id = baseShip.id + 1
        guard newShip.id <= 8 else { return }
        addChild(newShip)
        baseShip = newShip
    }
    
    // Panning gesture
    @IBAction func panGestureAction(_ sender: UIPanGestureRecognizer) {
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
