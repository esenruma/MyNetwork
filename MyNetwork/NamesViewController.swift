//
//  NamesViewController.swift
//  MyNetwork
//
//  Created by Roma on 30/05/2016.
//  Copyright © 2016 esenruma. All rights reserved.
//

import UIKit

class NamesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet weak var blur1: UIVisualEffectView!
    @IBOutlet weak var blur2: UIVisualEffectView!
    @IBOutlet weak var blur3: UIVisualEffectView!
    @IBOutlet weak var blur4: UIVisualEffectView!
    @IBOutlet weak var blur5: UIVisualEffectView!
    @IBOutlet weak var blur6: UIVisualEffectView!
    @IBOutlet weak var blur7: UIVisualEffectView!
    
    
    @IBOutlet weak var collectionFriends: UICollectionView!
    @IBOutlet weak var collectionFamily: UICollectionView!
    @IBOutlet weak var collectionWork: UICollectionView!
    @IBOutlet weak var collectionAlumni: UICollectionView!
    @IBOutlet weak var collectionSocial: UICollectionView!
    @IBOutlet weak var collectionInnerCircle: UICollectionView!
    @IBOutlet weak var collectionPersonalAdvisor: UICollectionView!
 
    
    // Stored names-Arrays of results of network Count per Category
//    var namesFor1stCatArray = [String]()        // ================
//    var namesFor2ndCatArray = [String]()        // ================
//    var namesFor3rdCatArray = [String]()        // ================
//    var namesFor4thCatArray = [String]()        // ================
//    var namesFor5thCatArray = [String]()        // ================
//    var namesFor6thCatArray = [String]()        // ================
//    var namesFor7thCatArray = [String]()        // ================
    // ==== What to do with these Stored Names? - into 3rd VC - Table??? ====
    
// -----------------------------------------------------------
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if view == self.collectionFriends {
            return namesFor1stCatArray.count
            
        } else if view == self.collectionFamily {
            return namesFor2ndCatArray.count
            
        } else if view == self.collectionWork {
            return namesFor3rdCatArray.count
            
        } else if view == self.collectionAlumni {
            return namesFor4thCatArray.count
            
        } else if view == self.collectionSocial {
            return namesFor5thCatArray.count
            
        } else if view == self.collectionInnerCircle {
            return namesFor6thCatArray.count
            
        } else if view == self.collectionPersonalAdvisor {
            return namesFor7thCatArray.count
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
// -----------------------------------------------------------
    @IBAction func backButton(sender: AnyObject) {
        
        performSegueWithIdentifier("names2Home", sender: nil)
        
        // dismissViewControllerAnimated(true, completion: nil) // NOT WORK WITH 1st VC Animation!!!!
        
        // ** nb **: Unable to to use "Flip-Horizontal" VC transition setup - Going Back "interfers" with 1st VC animation // So Used "Cover Vertical" !!!
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
