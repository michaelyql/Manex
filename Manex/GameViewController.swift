//
//  GameViewController.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import UIKit
import SpriteKit
import SideMenu

class GameViewController: UIViewController {
    
    private var sideMenu = SideMenuNavigationController(rootViewController: MenuViewController(with: ["Formations", "Manex Board", "Feedback"]))
    @IBOutlet weak var addShipButton: UIButton!
    @IBOutlet weak var removeShipButton: UIButton!
    var scene: GameScene? = nil
    
    // Perform a one-time instantiation and initialization of the VC's view's contents
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
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
    
    @IBAction func didTapMenuButton() {
        present(sideMenu, animated: true)
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
}

class MenuViewController: UITableViewController {
    
    private let menuItems: [String]
    
    init(with menuItems: [String]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Relay to delegate about menu item selection
        
    }
}
