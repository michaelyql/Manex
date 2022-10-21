//
//  GameViewController.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var toggleMenuButton: UIButton!
    @IBOutlet weak var addShipButton: UIButton!
    @IBOutlet weak var removeShipButton: UIButton!
    var scene: GameScene? = nil
    
    // Perform a one-time instantiation and initialization of the VC's view's contents
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "GameScene") {
                self.scene = scene
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
    
    @IBAction func addShip(_ sender: UIButton) {
        scene?.addShipToColummn()
    }
    
    @IBAction func removeShip(_ sender: UIButton) {
        scene?.removeShipFromColumn()
    }
    
    @IBAction func didTapToggleMenuButton(_ sender: UIButton) {
        sender.isSelected.toggle()
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
