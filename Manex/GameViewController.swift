//
//  GameViewController.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // Perform a one-time instantiation and initialization of the VC's view's contents
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .resizeFill
                
                // Adding camera node to the view
                let cameraNode = SKCameraNode()
                scene.camera = cameraNode
                scene.addChild(cameraNode)
                
                // Present the scene
                view.presentScene(scene)
            }
            view.isUserInteractionEnabled = true
            view.ignoresSiblingOrder = false
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
