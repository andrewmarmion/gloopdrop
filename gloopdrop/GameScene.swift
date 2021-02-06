//
//  GameScene.swift
//  gloopdrop
//
//  Created by Andrew Marmion on 05/02/2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let player = Player()
    let playerSpeed: CGFloat = 1.5

    
    override func didMove(to view: SKView) {
        // Set up the background
        let background = SKSpriteNode(imageNamed: "background_1")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint.zero
        background.zPosition = Layer.background.rawValue
        addChild(background)

        // Set up the foreground
        let foreground = SKSpriteNode(imageNamed: "foreground_1")
        foreground.position = CGPoint(x: 0, y: 0)
        foreground.anchorPoint = CGPoint.zero
        foreground.zPosition = Layer.foreground.rawValue
        addChild(foreground)

        // set up player
        player.position = CGPoint(x: size.width/2, y: foreground.frame.maxY)
        player.setupConstraints(floor: foreground.frame.maxY)
        addChild(player)
        player.walk()
    }

    // MARK: - TOUCH HANDLING

    /* ####################################################################### */
    /*                        TOUCH HANDLERS STARTS HERE                       */
    /* ####################################################################### */

    func touchDown(atPoint pos: CGPoint) {
        let distance = hypot(pos.x - player.position.x, pos.y - player.position.y)
        let calculatedSpeed = TimeInterval(distance / playerSpeed) / 255

        if pos.x < player.position.x {
            player.moveToPosition(pos: pos, direction: "L", speed: calculatedSpeed)
        } else {
            player.moveToPosition(pos: pos, direction: "R", speed: calculatedSpeed)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
        }
    }
}
