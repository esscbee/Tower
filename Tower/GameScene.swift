//
//  GameScene.swift
//  Tower
//
//  Created by Stephen Brennan on 7/19/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let moveUpTime : CGFloat = 5.0
    let blockHeight : CGFloat = 35.0
    var moveSeq : SKAction!
    var timer : NSTimer?
    
    override func didMoveToView(view: SKView) {
        let secondsPerPixel = moveUpTime / (frame.height + blockHeight)
        let secondsPerBlock = blockHeight * secondsPerPixel
        let timeInterval = secondsPerBlock * 1.05

        
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(timeInterval), target: self, selector: #selector(timerCallBack), userInfo: nil, repeats: true)
        
        let move = SKAction.moveTo(CGPoint(x: frame.width/2, y: frame.height + blockHeight), duration: Double(moveUpTime))
        let remove = SKAction.removeFromParent()
        moveSeq = SKAction.sequence([move, remove])
    }
    
    
    
    let colors = [ UIColor.blueColor(), UIColor.redColor(), UIColor.greenColor(), UIColor.purpleColor() ]
    
    func timerCallBack(data : AnyObject?) {
        let size = CGSize(width: frame.width, height: blockHeight)
        let theColor = colors[random() % colors.count ]
        let b = SKSpriteNode(color: theColor, size: size)
        b.anchorPoint = CGPoint(x: 0.5, y: 1)
        b.position = CGPoint(x: frame.width / 2, y: 0)
        addChild(b)
        b.runAction(moveSeq)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    deinit {
        if let t = timer {
            t.invalidate()
        }
        
    }
}
