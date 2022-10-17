//
//  GameViewController.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import UIKit
import SpriteKit
import SideMenu

class GameViewController: UIViewController, MenuControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    private let boardController = BoardViewController()
    @IBOutlet weak var addShipButton: UIButton!
    @IBOutlet weak var removeShipButton: UIButton!
    var scene: GameScene? = nil
    
    // Perform a one-time instantiation and initialization of the VC's view's contents
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuViewController(with: SideMenuItem.allCases)
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        addChildControllers()
        
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
    
    private func addChildControllers() {
        addChild(boardController)
        view.addSubview(boardController.view)
        boardController.view.frame = view.bounds
        boardController.didMove(toParent: self)
        boardController.view.isHidden = true
    }
    
    @IBAction func didTapMenuButton() {
        present(sideMenu!, animated: true)
    }
    
    @IBAction func addShip(_ sender: UIButton) {
        scene?.addShipToColummn()
    }
    
    @IBAction func removeShip(_ sender: UIButton) {
        scene?.removeShipFromColumn()
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
    
    // Implement function to conform to MenuControllerDelegate protocol
    func didSelectMenuItem(menuItem: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: nil)
        title = menuItem.rawValue
        switch menuItem {
        case.formation:
            boardController.view.isHidden = true
        case.board:
            boardController.view.isHidden = false
        case.feedback:
            boardController.view.isHidden = true
        }
    }
}
