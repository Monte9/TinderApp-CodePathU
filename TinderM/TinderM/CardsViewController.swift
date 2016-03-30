//
//  CardsViewController.swift
//  TinderM
//
//  Created by Monte's Pro 13" on 3/29/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardsView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardsView.profileImage = UIImage(named: "ryan")
        cardsView.about = "Ryan, 25"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
