//
//  ViewController.swift
//  SlideButton
//
//  Created by Alejandro on 7/22/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator = UIViewPropertyAnimator()
    var mainTranslationX: CGFloat!

    @IBOutlet weak var rightButtonView:      UIView!
    @IBOutlet weak var areaSlideToRightView: UIView!
    @IBOutlet weak var downButtonView:       UIView!
    @IBOutlet weak var areaSlideToDownView:  UIView!
    @IBOutlet weak var leftButtonView:       UIView!
    @IBOutlet weak var areaSlideToLeftView:  UIView!
    @IBOutlet weak var upButtonView:         UIView!
    @IBOutlet weak var areaSlideToUpView:    UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingScreen()
        movementsButtons()
    }
    
    func settingScreen(){
        areaSlideToRightView.backgroundColor = .clear
        areaSlideToDownView.backgroundColor = .clear
        areaSlideToLeftView.backgroundColor = .clear
        areaSlideToUpView.backgroundColor = .clear
    }
    
    func movementsButtons(){
        
        rightButtonView.isUserInteractionEnabled = true
        rightButtonView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleRightPanMoveView(recognizer:))))
        
        downButtonView.isUserInteractionEnabled = true
        downButtonView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDownPanMoveView(recognizer:))))
        
        leftButtonView.isUserInteractionEnabled = true
        leftButtonView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleLeftPanMoveView(recognizer:))))
        
        upButtonView.isUserInteractionEnabled = true
        upButtonView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleUpPanMoveView(recognizer:))))
        
        //  Convert to variable:
        //  72. rightButtonView
        //  72. x: areaSlideToRightView.layer.bounds.size.width-50 and y:0
        //  77. in: self.areaSlideToRightView).x / (CGFloat(self.areaSlideToRightView.layer.bounds.size.width)
        //  87. self.rightButtonView.transform = CGAffineTransform.identity
        
    }
    
    @objc func handleRightPanMoveView(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
                self.rightButtonView.transform = CGAffineTransform(translationX: CGFloat(self.areaSlideToRightView.layer.bounds.size.width-50) , y: 0)
            })
            animator.startAnimation()
            animator.pauseAnimation()
        case .changed:
            animator.fractionComplete = recognizer.translation(in: self.areaSlideToRightView).x / (CGFloat(self.areaSlideToRightView.layer.bounds.size.width))
        case .ended:
            if animator.fractionComplete > 0.80 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "test") as! Test
                self.present(s, animated: true)
            }
            else {
                animator.stopAnimation(true)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                    self.rightButtonView.transform = CGAffineTransform.identity
                }, completion: { (completed) in
                    
                })
            }
            
            
        default:
            ()
        }
    }

    @objc func handleDownPanMoveView(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
                self.downButtonView.transform = CGAffineTransform(translationX: 0 , y: CGFloat(self.areaSlideToDownView.layer.bounds.size.height-50))
            })
            animator.startAnimation()
            animator.pauseAnimation()
        case .changed:
            animator.fractionComplete = recognizer.translation(in: self.areaSlideToDownView).y / (CGFloat(self.areaSlideToDownView.layer.bounds.size.height))
        case .ended:
            if animator.fractionComplete > 0.80 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "test") as! Test
                self.present(s, animated: true)
            }
            else {
                animator.stopAnimation(true)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                    self.downButtonView.transform = CGAffineTransform.identity
                }, completion: { (completed) in
                    
                })
            }
            
            
        default:
            ()
        }
    }
    
    @objc func handleLeftPanMoveView(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
                self.leftButtonView.transform = CGAffineTransform(translationX: -CGFloat(self.areaSlideToLeftView.layer.bounds.size.width-50) , y: 0)
            })
            animator.startAnimation()
            animator.pauseAnimation()
        case .changed:
            animator.fractionComplete = recognizer.translation(in: self.areaSlideToLeftView).x / (-CGFloat(self.areaSlideToLeftView.layer.bounds.size.width))
        case .ended:
            if animator.fractionComplete > 0.80 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "test") as! Test
                self.present(s, animated: true)
            }
            else {
                animator.stopAnimation(true)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                    self.leftButtonView.transform = CGAffineTransform.identity
                }, completion: { (completed) in
                    
                })
            }
            
            
        default:
            ()
        }
    }
    
    @objc func handleUpPanMoveView(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
                self.upButtonView.transform = CGAffineTransform(translationX: 0 , y: -CGFloat(self.areaSlideToUpView.layer.bounds.size.height-50))
            })
            animator.startAnimation()
            animator.pauseAnimation()
        case .changed:
            animator.fractionComplete = recognizer.translation(in: self.areaSlideToUpView).y / (-CGFloat(self.areaSlideToUpView.layer.bounds.size.height))
        case .ended:
            if animator.fractionComplete > 0.80 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "test") as! Test
                self.present(s, animated: true)
            }
            else {
                animator.stopAnimation(true)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                    self.upButtonView.transform = CGAffineTransform.identity
                }, completion: { (completed) in
                    
                })
            }
            
            
        default:
            ()
        }
    }
}

