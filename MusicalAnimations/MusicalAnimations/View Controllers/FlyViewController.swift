//
//  FlyViewController.swift
//  MusicalAnimations
//
//  Created by Don Riz Jaring on 4/17/20.
//  Copyright © 2020 DJ Initiatives. All rights reserved.
//

import UIKit

class FlyViewController: UIViewController {

    var flyLayer : CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let flyImage = UIImage(named: "dunkee.png")
        flyLayer = CALayer.init()
        flyLayer?.contents = flyImage?.cgImage
        flyLayer?.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
        flyLayer?.position = CGPoint(x: 200, y: 200)
        self.view.layer.addSublayer(flyLayer!)
        
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let fromPosition = CGPoint(x: 300, y: 300)
        let toPosition = CGPoint(x: 500, y: 500)

        moveAnimation.fromValue = fromPosition
        moveAnimation.toValue = toPosition
        moveAnimation.isRemovedOnCompletion = false
        moveAnimation.duration = 3.0
        moveAnimation.repeatCount = Float.infinity
        flyLayer?.add(moveAnimation, forKey: nil)
        
//        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
//        rotateAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
////
//        moveAnimation.fromValue = NSValue.init(cgPoint: CGPoint(x: 200, y: 200))
//        moveAnimation.toValue = NSValue.init(cgPoint: CGPoint(x: 700, y: 500))
//        moveAnimation.isRemovedOnCompletion = false
//        moveAnimation.duration = 1.0
//        moveAnimation.repeatCount = Float.infinity
//        flyLayer?.add(moveAnimation, forKey: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
