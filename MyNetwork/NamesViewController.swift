//
//  NamesViewController.swift
//  MyNetwork
//
//  Created by Roma on 30/05/2016.
//  Copyright © 2016 esenruma. All rights reserved.
//

import UIKit

class NamesViewController: UIViewController {

    
    
    @IBAction func backButton(sender: AnyObject) {
        
        performSegueWithIdentifier("names2Home", sender: nil)
        
        // dismissViewControllerAnimated(true, completion: nil) // NOT WORK WITH 1st VC Animation!!!!
        
        // ** nb **: Unable to to use "Flip-Horizontal" VC transition setup - Going Back "interfers" with 1st VC animation // So Used "Cover Vertical" !!!
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
