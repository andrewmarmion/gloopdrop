//
//  GameScene.swift
//  gloopdrop
//
//  Created by Andrew Marmion on 05/02/2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        // Set up the background
        let background = SKSpriteNode(imageNamed: "background_1")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint.zero
        addChild(background)

        // Set up the foreground
        let foreground = SKSpriteNode(imageNamed: "foreground_1")
        foreground.position = CGPoint(x: 0, y: 0)
        foreground.anchorPoint = CGPoint.zero
        addChild(foreground)
    }
}
