//
//  ViewController.swift
//  17.CoreAnimation
//
//  Created by wz on 2017/9/13.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var animationLayer: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true
        let animationLayer = CALayer()
        animationLayer.backgroundColor = NSColor.orange.cgColor
        animationLayer.frame = view.bounds.insetBy(dx: 50, dy: 50)
        view.layer?.addSublayer(animationLayer)
        self.animationLayer = animationLayer
    }
    
    
    
    @IBAction func leftAction(_ sender: Any) {
        
        setAngle(degree: 45)
    }
    
    

    @IBAction func rightAction(_ sender: Any) {
        
        setAngle(degree: -45)
    }
    
    
    func setAngle(degree: CGFloat) {
        let radius = CGFloat(Double.pi) * degree / 180.0
        var transform = CATransform3DIdentity
        transform.m34 = 1 / -259
        transform = CATransform3DRotate(transform, radius, 0, 1, 0)
        animationLayer?.transform = transform
    }
}

