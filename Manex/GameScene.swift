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
    // Standard ship formations (line abreast) - Recursive function
    // Toggle to calculate and display the distance between each ship (SD and MI)
    // Rotating ship function
    // Function for calculating destination point for ships
    // Consider adding animation for ships transiting into new position
    /* Add time and space calculations as well - how much time is needed to reach the point, what speed and heading to proceed at */
    // Reset button to return to start position
    
    var previousCameraPoint = CGPoint.zero
    var lastShip: Ship = Ship(shipType: .large)
    
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
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    // Overriding methods to allow the Scene and its nodes to respond to touch events
    /* Update 15/10/2022: Buttons now configured as UIButtons in the view, instead of SKNodes in the SKScene */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
//        let frontTouchedNode = atPoint(location)
    }
    
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
    
    // Panning gesture
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
    
    /* Camera is still buggy as sender.scale is deleted from memory and reset to value of 1 every time the function is called */
    @objc func pinchGestureAction(_ sender: UIPinchGestureRecognizer) {
        guard let camera = self.camera else { return }
        if sender.state == .began || sender.state == .changed {
            camera.xScale = 1 / sender.scale
            camera.yScale = 1 / sender.scale
        }
    }
}
