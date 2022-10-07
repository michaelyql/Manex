//
//  GameScene.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var tileGroup: SKTileGroup?
    var tileMap: SKTileMapNode?
    var addButton: SKLabelNode?
    var removeButton: SKLabelNode?

    
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
        
        let shipTexture = SKTexture(imageNamed: "ship")
        let ship = SKTileDefinition(texture: shipTexture)
        let shipGroup = SKTileGroup(tileDefinition: ship)
        let tileSet = SKTileSet(tileGroups: [shipGroup], tileSetType: .grid)
        let tileSize = tileSet.defaultTileSize
        tileMap = SKTileMapNode(tileSet: tileSet, columns: 8, rows: 8, tileSize: tileSize)
        self.tileGroup = tileSet.tileGroups.first
        
        tileMap!.setTileGroup(tileGroup, forColumn: 1, row: 7)
        
        addChild(tileMap!)
        
        // Add button
        addButton = SKLabelNode(text: "Add Ship")
        addButton!.name = "addButton"
        addButton!.fontSize = CGFloat(36)
        addButton!.fontColor = .black
        addButton!.position = CGPoint(x: -size.width * 0.25, y: -size.height * 0.4)
        addChild(addButton!)
        
        // Remove button
        removeButton = SKLabelNode(text: "Remove Ship")
        removeButton!.name = "removeButton"
        removeButton!.fontSize = CGFloat(36)
        removeButton!.fontColor = .black
        removeButton!.position = CGPoint(x: size.width * 0.25, y: -size.height * 0.4)
        addChild(removeButton!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
//        let touchedNodes = nodes(at: location)
        let frontTouchedNode = atPoint(location).name
                
        switch frontTouchedNode {
            case addButton!.name:
                tileMap!.setTileGroup(tileGroup, forColumn: 1, row: 7)
            case removeButton!.name:
                tileMap!.setTileGroup(nil, forColumn: 1, row: 7)
            default:
                break
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}
