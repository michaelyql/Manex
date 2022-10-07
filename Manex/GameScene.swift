//
//  GameScene.swift
//  Manex
//
//  Created by michaelyangqianlong on 3/10/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var tileMap: SKTileMapNode?
    var addButton: SKLabelNode?
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
        let tileGroup =  tileSet.tileGroups.first
//        tileMap.fill(with: tileGroup)
        tileMap!.setTileGroup(tileGroup, forColumn: 1, row: 7)
        
        self.addChild(tileMap!)
        
        addButton = self.childNode(withName: "addButton") as? SKLabelNode
        addButton!.fontSize = CGFloat(36)
        addButton!.fontColor = .black
        
        
//        let rect = SKShapeNode(rect: CGRect(x: size.width/2, y: size.height/2, width: 200, height: 200 ))
//        rect.fillColor = .blue
//        rect.lineWidth = 2
//        rect.strokeColor = .red
//        rect.glowWidth = 0.5
//        addChild(rect)
        
//        let radius = CGFloat(Float(100))
//        let circle = SKShapeNode(circleOfRadius: radius)
//        circle.position = CGPoint(x: 0, y: 0)
//        circle.fillColor = .brown
//        addChild(circle)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        let frontTouchedNode = atPoint(location).name
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}
