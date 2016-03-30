//
//  DraggableImageView.swift
//  TinderM
//
//  Created by Monte's Pro 13" on 3/29/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var aboutLabel: UILabel!
    
    //points to keep track of image panning
    var initialCenterPoint: CGPoint?
    var currentCenterPoint: CGPoint?
    var prevTranslationValue: CGFloat? = 0
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
        
        currentCenterPoint = profileImageView.center
        print("The current center point is: \(currentCenterPoint)")
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    //Getters and setters
    var about: String? {
        get { return aboutLabel?.text }
        set { aboutLabel.text = newValue }
    }
    
    //Getters and setters
    var profileImage: UIImage? {
        get { return profileImageView.image }
        set { profileImageView.image = newValue }
    }

    //Pan Gesture Recognizer Action
    @IBAction func onImagePanGesture(sender: UIPanGestureRecognizer) {

        let translation = sender.translationInView(contentView)
        
        initialCenterPoint = sender.view?.center
        
        if sender.state == UIGestureRecognizerState.Ended {
            //set the current center to the imagecenter
            currentCenterPoint = profileImageView.center
        } else if sender.state == UIGestureRecognizerState.Ended {
            profileImageView.center.x = CGFloat(160)
            aboutLabel.center.x = CGFloat(160)
        } else if sender.state == UIGestureRecognizerState.Changed {
            profileImageView.center.x = profileImageView.center.x + translation.x - prevTranslationValue!
            aboutLabel.center.x = aboutLabel.center.x + translation.x - prevTranslationValue!
            prevTranslationValue = translation.x
        }
    }    
    
}
