//
//  CardsViewController.swift
//  TinderM
//
//  Created by Monte's Pro 13" on 3/29/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    var initialCenterPoint: CGPoint?
    var currentCenterPoint: CGPoint?
    var prevTranslationValue: CGFloat? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentCenterPoint = profileImageView.center
        print("The current center point is: \(currentCenterPoint)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onImagePanGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
        let translation = panGestureRecognizer.translationInView(view)
        
        initialCenterPoint = panGestureRecognizer.view?.center
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            //set the current center to the imagecenter
            currentCenterPoint = profileImageView.center
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            profileImageView.center.x = CGFloat(160)
            print("here?")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            profileImageView.center.x = profileImageView.center.x + translation.x - prevTranslationValue!
            prevTranslationValue = translation.x
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
