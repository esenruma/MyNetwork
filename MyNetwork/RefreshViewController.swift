//
//  RefreshViewController.swift
//  MyNetwork
//
//  Created by Roma on 01/06/2016.
//  Copyright © 2016 esenruma. All rights reserved.
//

import UIKit

class RefreshViewController: UIViewController {

    
    override func viewDidAppear(animated: Bool) {
        
        // Refresh Arrays holding data to "nil" (names in Categories)
        namesFor1stCatArray.removeAll()
        namesFor2ndCatArray.removeAll()
        namesFor3rdCatArray.removeAll()
        namesFor4thCatArray.removeAll()
        namesFor5thCatArray.removeAll()
        namesFor6thCatArray.removeAll()
        namesFor7thCatArray.removeAll()
        
        // Go to Home Screen
        performSegueWithIdentifier("refresh2Home", sender: nil)

    }
    
    func goBackToHome() {
        
//         performSegueWithIdentifier("refresh2Home", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        goBackToHome()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
