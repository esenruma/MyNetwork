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
    
    @IBOutlet var backButtonLink: UIButton!
    
    
// -----------------------------------------------------------
    override func viewWillAppear(animated: Bool) {
        
        self.backButtonLink.alpha = 0.0
        self.blur1.alpha = 0.0
        self.blur2.alpha = 0.0
        self.blur3.alpha = 0.0
        self.blur4.alpha = 0.0
        self.blur5.alpha = 0.0
        self.blur6.alpha = 0.0
        self.blur7.alpha = 0.0
    }
    
// -----------------------------------------------------------
    override func viewDidAppear(animated: Bool) {
        
        self.backButtonLink.alpha = 1.0
        self.blur1.alpha = 1.0
        self.blur2.alpha = 1.0
        self.blur3.alpha = 1.0
        self.blur4.alpha = 1.0
        self.blur5.alpha = 1.0
        self.blur6.alpha = 1.0
        self.blur7.alpha = 1.0
        
        //  XCode Message: For Above Alpha change
        //  2016-05-31 11:32:36.510 MyNetwork[1827:231455] <UIVisualEffectView 0x7ff0116b4270> is being asked to animate its opacity. This will cause the effect to appear broken until opacity returns to 1.
        
        // Animation Start = Here vs. 'ViewDidLayoutSubViews' = Starting Point
        self.blur1.center = CGPointMake(self.blur1.center.x - 400, self.blur1.center.y)
        self.blur2.center = CGPointMake(self.blur2.center.x - 400, self.blur2.center.y)
        self.blur3.center = CGPointMake(self.blur3.center.x - 400, self.blur3.center.y)
        self.blur4.center = CGPointMake(self.blur4.center.x - 400, self.blur4.center.y)
        self.blur5.center = CGPointMake(self.blur5.center.x - 400, self.blur5.center.y)
        self.blur6.center = CGPointMake(self.blur6.center.x - 400, self.blur6.center.y)
        self.blur7.center = CGPointMake(self.blur7.center.x - 400, self.blur7.center.y)
        
        self.backButtonLink.center = CGPointMake(self.backButtonLink.center.x - 400, self.backButtonLink.center.y)
        
        
        // ---------------------------------
        UIView.animateWithDuration(1.0, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.blur1.center = CGPointMake(self.blur1.center.x + 400, self.blur1.center.y)
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.blur2.center = CGPointMake(self.blur2.center.x + 400, self.blur2.center.y)
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.blur3.center = CGPointMake(self.blur3.center.x + 400, self.blur3.center.y)
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.4, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.blur4.center = CGPointMake(self.blur4.center.x + 400, self.blur4.center.y)
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.blur5.center = CGPointMake(self.blur5.center.x + 400, self.blur5.center.y)
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.6, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.blur6.center = CGPointMake(self.blur6.center.x + 400, self.blur6.center.y)
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.7, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.blur7.center = CGPointMake(self.blur7.center.x + 400, self.blur7.center.y)
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.8, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.backButtonLink.center = CGPointMake(self.backButtonLink.center.x + 400, self.backButtonLink.center.y)
            }, completion: nil)
    }
    
// -----------------------------------------------------------
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionFriends {
            return namesFor1stCatArray.count
            
        } else if collectionView == self.collectionFamily {
            return namesFor2ndCatArray.count
            
        } else if collectionView == self.collectionWork {
            return namesFor3rdCatArray.count
            
        } else if collectionView == self.collectionAlumni {
            return namesFor4thCatArray.count
            
        } else if collectionView == self.collectionSocial {
            return namesFor5thCatArray.count
            
        } else if collectionView == self.collectionInnerCircle {
            return namesFor6thCatArray.count
            
        } else if collectionView == self.collectionPersonalAdvisor {
            return namesFor7thCatArray.count
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = UICollectionViewCell()
        
        if (collectionView == self.collectionFriends) {
            
            let cellA = self.collectionFriends.dequeueReusableCellWithReuseIdentifier("Cell1", forIndexPath: indexPath) as! FriendsCustomCell
            
                cellA.friendNames.text = namesFor1stCatArray[indexPath.row]
            
            return cellA
            
        } else if (collectionView == self.collectionFamily) {
            
            let cellB = self.collectionFamily.dequeueReusableCellWithReuseIdentifier("Cell2", forIndexPath: indexPath) as! FamilyCustomCell
            
                cellB.familyNames.text = namesFor2ndCatArray[indexPath.row]
            
            return cellB
            
        } else if (collectionView == self.collectionWork) {
            
            let cellC = self.collectionWork.dequeueReusableCellWithReuseIdentifier("Cell3", forIndexPath: indexPath) as! WorkCustomCell
            
                cellC.workNames.text = namesFor3rdCatArray[indexPath.row]
            
            return cellC
            
        } else if (collectionView == self.collectionAlumni) {
            
            let cellD = self.collectionAlumni.dequeueReusableCellWithReuseIdentifier("Cell4", forIndexPath: indexPath) as! AlumniCustomCell
            
                cellD.alumniNames.text = namesFor4thCatArray[indexPath.row]
            
            return cellD
        
        } else if (collectionView == self.collectionSocial) {
            
            let cellE = self.collectionSocial.dequeueReusableCellWithReuseIdentifier("Cell5", forIndexPath: indexPath) as! SocialCustomCell
            
                cellE.socialNames.text = namesFor5thCatArray[indexPath.row]
            
            return cellE
        
        } else if (collectionView == self.collectionInnerCircle) {
            
            let cellF = self.collectionInnerCircle.dequeueReusableCellWithReuseIdentifier("Cell6", forIndexPath: indexPath) as! InnerCircleCustomCell
            
                cellF.innerCircleNames.text = namesFor6thCatArray[indexPath.row]
            
            return cellF
    
        } else if (collectionView == self.collectionPersonalAdvisor) {
            
            let cellG = self.collectionPersonalAdvisor.dequeueReusableCellWithReuseIdentifier("Cell7", forIndexPath: indexPath) as! PersonalAdvisorCustomCell
            
                cellG.personalAdvisorNames.text = namesFor7thCatArray[indexPath.row]
            
            return cellG
        }
        
        return cell
    }
    
// -----------------------------------------------------------
    @IBAction func backButton(sender: AnyObject) {
        
        // Stored names-Arrays of results of network Count per Category
        // Remove All Data in them to stop Duplication of contact names showing up
        namesFor1stCatArray.removeAll()
        namesFor2ndCatArray.removeAll()
        namesFor3rdCatArray.removeAll()
        namesFor4thCatArray.removeAll()
        namesFor5thCatArray.removeAll()
        namesFor6thCatArray.removeAll()
        namesFor7thCatArray.removeAll()
        
        // Go Back to 1st VC
        performSegueWithIdentifier("names2Home", sender: nil)
        // dismissViewControllerAnimated(true, completion: nil)
        
    }
    
// -----------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
