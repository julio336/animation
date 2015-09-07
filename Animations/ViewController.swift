//
//  ViewController.swift
//  Animations
//
//  Created by Julio Ahuactzin on 06/09/15.
//  Copyright (c) 2015 Julio Ahuactzin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var arr:[String] = ["frame1.jpg,", "frame2.jpg", "frame3.jpg", "frame4.jpg", "frame5.jpg"]
    var i = 1
    var timer = NSTimer()
    var counter = 1


    @IBOutlet var animatedImage: UIImageView!

    @IBOutlet var buttonAnimate: UIButton!
    
    @IBAction func updateImage(sender: AnyObject) {
        if counter == 1 {
            stopAnimation()
            counter++
        } else {
            activeAnimation()
            counter = 1
        }
        
        
    }
    
    func stopAnimation(){
        timer.invalidate()
        buttonAnimate.setTitle("Animate", forState: .Normal)

    }
    
    func activeAnimation(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "doAnimation", userInfo: nil, repeats: true)
        buttonAnimate.setTitle("Stop", forState: .Normal)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "doAnimation", userInfo: nil, repeats: true)
        
        
    }
    
    func doAnimation(){
        if i == 5 {
            i = 1
        } else {
            animatedImage.image = UIImage(named: arr[i])
            i++

        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

/*
    override func viewDidLayoutSubviews() {
        animatedImage.center = CGPointMake(animatedImage.center.x - 400, animatedImage.center.y)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            
            self.animatedImage.center = CGPointMake(self.animatedImage.center.x + 400, self.animatedImage.center.y)
            
        })
        
    }
  */
    
    
}

