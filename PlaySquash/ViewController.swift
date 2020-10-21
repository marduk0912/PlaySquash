//
//  ViewController.swift
//  PlaySquash
//
//  Created by Fernando on 26/06/2019.
//  Copyright © 2019 Fernando Salvador. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    

    @IBOutlet weak var banner: GADBannerView!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        banner.rootViewController = self
        banner.load(GADRequest())
        // Do any additional setup after loading the view.
    }


}


