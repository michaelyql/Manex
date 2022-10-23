//
//  GameViewController.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var signalConfigView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var scene: GameScene? = nil
    
    // Perform a one-time instantiation and initialization of the VC's view's contents
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load formation scene
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
        menuView.isHidden = true
        signalConfigView.isHidden = true
        collectionView.register(SignalCollectionViewCell.nib(), forCellWithReuseIdentifier: SignalCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    @IBAction func didTapAddShipButton(_ sender: UIButton) {
        scene?.addShipToColummn()
    }
    
    @IBAction func didTapRemoveShipButton(_ sender: UIButton) {
        scene?.removeShipFromColumn()
    }
    
    @IBAction func didTapExecuteSignalButton(_ sender: UIButton) {
        signalConfigView.isHidden.toggle()
    }
    
    @IBAction func didTapToggleMenuButton(_ sender: UIButton) {
        if menuView.isHidden == true {
            menuView.alpha = 0
            menuView.isHidden.toggle()
            UIView.animate(withDuration: 1.0) { [self] in
                menuView.alpha = 1.0
            }
        }
        else {
            menuView.isHidden.toggle()
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
