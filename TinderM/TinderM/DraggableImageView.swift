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
    
    //method that rotates the image based on degree/clockwise
    func rotateAndTranslate(contentView: UIView, clockwise: Bool, translation: CGFloat) {
        
        let direction = clockwise ? 1 : -1
        
        let transformation = CGAffineTransformMakeRotation(CGFloat(direction) * ( (translation/8) * CGFloat(M_PI)) / 180.0)
        contentView.transform = transformation
        
        contentView.center.x = profileImageView.center.x + translation
        
    }

    //Pan Gesture Recognizer Action
    @IBAction func onImagePanGesture(sender: UIPanGestureRecognizer) {

        let translation = sender.translationInView(contentView)
        
        initialCenterPoint = sender.view?.center
        
        if sender.state == UIGestureRecognizerState.Began {
            //set the current center to the imagecenter
            currentCenterPoint = profileImageView.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            //get the point of touch to detect top half or bottom half
            let point = sender.locationInView(contentView)
            
            //detect the drag to left or right
            if translation.x > contentView.center.x && point.y > contentView.center.y {
                //if dragged to the right, rotate clockwise
                rotateAndTranslate(self.contentView, clockwise: true, translation: translation.x)
            } else if translation.x > contentView.center.x  && point.y <= contentView.center.y {
                //else to the left, rotate counter clockwise
                rotateAndTranslate(self.contentView, clockwise: false, translation: translation.x)
            } else if translation.x <= contentView.center.x  && point.y > contentView.center.y {
                //else to the left, rotate counter clockwise
                rotateAndTranslate(self.contentView, clockwise: false, translation: translation.x)
            } else if translation.x <= contentView.center.x  && point.y <= contentView.center.y {
                //else to the left, rotate counter clockwise
                rotateAndTranslate(self.contentView, clockwise: true, translation: translation.x)
            }
        }
    }
    
}
