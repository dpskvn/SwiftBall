//
//  ViewController.swift
//  CrystalBall
//
//  Created by Dino Paskvan on 06/06/14.
//  Copyright (c) 2014 Dino Paskvan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var predictionLabel : UILabel
    @IBOutlet var backgroundImageView : UIImageView = nil
    let crystalBall: CrystalBall = CrystalBall()
    var soundEffect = AVAudioPlayer()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        var imagesArr = [UIImage]()
        for num in 1...60 {
            if num < 10 {
                imagesArr.append(UIImage(named: "CB0000\(num)"))
            } else {
                imagesArr.append(UIImage(named: "CB000\(num)"))
            }
        }
        
        let soundPath = NSBundle.mainBundle().pathForResource("crystal_ball", ofType: "mp3")
        let soundURL = NSURL.fileURLWithPath(soundPath)

        soundEffect = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        soundEffect.prepareToPlay()
        
        backgroundImageView.animationImages = imagesArr
        
        backgroundImageView.animationDuration = 2.5
        
        backgroundImageView.animationRepeatCount = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent!) {
        predictionLabel.text = ""
        predictionLabel.alpha = 0.0
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if motion == UIEventSubtype.MotionShake {
            makePrediction()
        }
    }
    
    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent!)  {
        println("motion cancelled")
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.predictionLabel.text = ""
        predictionLabel.alpha = 0.0
    }
    
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        makePrediction()
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        println("touches cancelled")
    }
    
    func makePrediction() {
        backgroundImageView.startAnimating()
        predictionLabel.text = crystalBall.randomPrediction()
        soundEffect.play()
        UIView.animateWithDuration(6.0, animations: {
                self.predictionLabel.alpha = 1.0
            })
    }
}