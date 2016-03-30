//
//  ProfileViewController.swift
//  
//
//  Created by Monte's Pro 13" on 3/30/16.
//
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var aboutLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.image = UIImage(named: "monte")
        aboutLabel.text = "Monte, 21"
        locationLabel.text = "5 miles away"
        
    }
    
    @IBAction func dismissProfileView(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: {})
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
