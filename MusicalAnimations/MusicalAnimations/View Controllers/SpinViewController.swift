//
//  SpinViewController.swift
//  MusicalAnimations
//
//  Created by Don Riz Jaring on 4/17/20.
//  Copyright © 2020 DJ Initiatives. All rights reserved.
//

import UIKit
import AVFoundation

class SpinViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet var volSlider : UISlider!
    var soundPlayer : AVAudioPlayer?
    var spinLayer : CALayer?
    
    @IBAction func volumeDidChange(sender: UISlider) {
        soundPlayer?.volume = volSlider.value
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let soundURL = Bundle.main.path(forResource: "song1", ofType: "mp3")
        let url = URL(fileURLWithPath: soundURL!)
        self.soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        self.soundPlayer?.currentTime = 0
        self.soundPlayer?.volume = volSlider.value
        self.soundPlayer?.numberOfLoops = -1
        self.soundPlayer?.play()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.soundPlayer?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let spinImage = UIImage(named: "munkee.png")
        spinLayer = CALayer.init()
        spinLayer?.contents = spinImage?.cgImage
        
        spinLayer?.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
        spinLayer?.position = CGPoint(x: 200, y: 200)
        self.view.layer.addSublayer(spinLayer!)
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = 2 * Double.pi
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 1.0
        rotateAnimation.repeatCount = Float.infinity
        spinLayer?.add(rotateAnimation, forKey: nil)
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
