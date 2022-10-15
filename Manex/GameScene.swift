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
    // Static Menu Node fixed to the camera with all the functions
    // Display ship ID number next to ship -- This can be a nested class
    // Add toggle button for showing / hiding ship ID number
    // func addShipToRow() {}
    // Standard ship formations (column and line abreast) - Recursive function
    
    var previousCameraPoint = CGPoint.zero
    var lastShip: Ship = Ship(imageNamed: "warship_large_v2", sd: 150, mi: 150)
    var addButton = SKLabelNode(text: "Add Ship")
    var removeButton = SKLabelNode(text: "Remove Ship")
    
    override var isUserInteractionEnabled: Bool {
        get {
            return true
        }
        set {}
    }
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        
        // Gesture recognizer for panning
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGesture)
        
        // Gesture recognizer for pinching
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureAction(_:)))
        view.addGestureRecognizer(pinchGesture)
        
        self.addChild(lastShip)
        lastShip.position = CGPoint(x: frame.midX, y: frame.midY)
        
        guard let camera = self.camera else { return }
        camera.addChild(addButton)
        addButton.fontColor = .black
        addButton.name = "addButton"
        addButton.zPosition = 2
        addButton.position = CGPoint(x: frame.minX + 60, y: frame.minY + 50)
        
        camera.addChild(removeButton)
        removeButton.fontColor = .black
        removeButton.name = "removeButton"
        removeButton.zPosition = 2
        removeButton.position = CGPoint(x: frame.maxX - 100, y: frame.minY + 50)
    
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    // Overriding methods to allow the Scene and its nodes to respond to touch events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let frontTouchedNode = atPoint(location)
        if frontTouchedNode.name == "addButton" {
            addShipToColummn()
        }
        if frontTouchedNode.name == "removeButton" {
            removeShipFromColumn()
        }
    }
    
    func addShipToColummn() {
        let newShip = Ship(imageNamed: "warship_large_v2", sd: 150, mi: 150, prev: lastShip)
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
    
    /* Camera is still buggy as sender.scale is deleted from memory and reset to value of 1 every time the function is called */
    @IBAction func pinchGestureAction(_ sender: UIPinchGestureRecognizer) {
        guard let camera = self.camera else { return }
        if sender.state == .began || sender.state == .changed {
            camera.xScale = 1 / sender.scale
            camera.yScale = 1 / sender.scale
        }
    }
}
