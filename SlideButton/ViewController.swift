//
//  ViewController.swift
//  SlideButton
//
//  Created by Alejandro on 7/22/19.
//  Copyright © 2019 Alejandro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideBlueView: UIView!
    
    var animator = UIViewPropertyAnimator()
    var mainTranslationX: CGFloat!
    @IBOutlet weak var areaSlideButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        slideBlueView.isUserInteractionEnabled = true
        slideBlueView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanMoveView(recognizer:))))
    }

    
    @objc func handlePanMoveView(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
                self.slideBlueView.transform = CGAffineTransform(translationX: -CGFloat(self.areaSlideButtonView.layer.bounds.size.width-50) , y: 0)
            })
            animator.startAnimation()
            animator.pauseAnimation()
        case .changed:
            animator.fractionComplete = recognizer.translation(in: self.areaSlideButtonView).x / (-CGFloat(self.areaSlideButtonView.layer.bounds.size.width))
        case .ended:
            if animator.fractionComplete > 0.80 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "test") as! Test
                self.present(s, animated: true)
            }
            else {
                animator.stopAnimation(true)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                    self.slideBlueView.transform = CGAffineTransform.identity
                }, completion: { (completed) in
                    
                })
            }
            
            
        default:
            ()
        }
    }
    
//    @objc func handlePanMoveView(recognizer: UIPanGestureRecognizer) {
//        //let popAux = viewControllers.first as? Test
//        //Ir de derecha a izquierda
//        if isViewRight {
//            switch recognizer.state {
//            case .began:
//                animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
//                    self.slideBlueView.transform = CGAffineTransform(translationX: -CGFloat(self.areaSlideButtonView.layer.bounds.size.width-50) , y: 0)
//                    //popAux?.view.backgroundColor = PaletaColoresElite().transparenteBlancoPlus
//
//                })
//                animator.startAnimation()
//                animator.pauseAnimation()
//            case .changed:
//                animator.fractionComplete = recognizer.translation(in: self.areaSlideButtonView).x / (-CGFloat(self.areaSlideButtonView.layer.bounds.size.width))
//            //animator.fractionComplete = recognizer.translation(in: self.view).y / (-self.mainTranslationY)
//            case .ended:
//                if animator.fractionComplete > 0.30 {
//                    animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
//                    //                        let s = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "test") as! Test
//                    //                        self.present(s, animated: true)
//                    isViewRight = false
//                } else {
//                    animator.stopAnimation(true)
//                    UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
//                        self.slideBlueView.transform = CGAffineTransform.identity
//                        //popAux?.view.backgroundColor = PaletaColoresElite().blanco
//                    }, completion: { (completed) in
//
//                    })
//                }
//            default:
//                ()
//            }
//        }
//    }

}

