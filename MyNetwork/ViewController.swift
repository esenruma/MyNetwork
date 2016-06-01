//
//  ViewController.swift
//  MyNetwork
//
//  Created by Roma on 25/05/2016.
//  Copyright © 2016 esenruma. All rights reserved.
//

import UIKit
import Contacts

var categoriesChosen = 0        // 0 = Default, 1 = new Categories(Future)

// -----------default-Categories------------------------
let dCat1 = "Friends"               // f.
let dCatCode1 = "f."

let dCat2 = "Family"                // fam.
let dCatCode2 = "fam."

let dCat3 = "Work"                  // w.
let dCatCode3 = "w."

let dCat4 = "Alumni"                // al.
let dCatCode4 = "al."

let dCat5 = "Social"                // s.
let dCatCode5 = "s."

let dCat6 = "Inner Circle"          // in.
let dCatCode6 = "in."

let dCat7 = "Personal Advisor"      // ad.
let dCatCode7 = "ad."

// Stored names-Arrays of results of network Count per Category
var namesFor1stCatArray = [String]()
var namesFor2ndCatArray = [String]()
var namesFor3rdCatArray = [String]()
var namesFor4thCatArray = [String]()
var namesFor5thCatArray = [String]()
var namesFor6thCatArray = [String]()
var namesFor7thCatArray = [String]()


// -----------------------------------------------------
class ViewController: UIViewController {

    @IBOutlet weak var totalContactsNumber: UILabel!
    @IBOutlet weak var totalPersonalNetworkNumber: UILabel!
    
    @IBOutlet weak var firstCatLabel: UILabel!
    @IBOutlet weak var firstCatNumber: UILabel!
    
    @IBOutlet weak var secondCatLabel: UILabel!
    @IBOutlet weak var secondCatNumber: UILabel!
    
    @IBOutlet weak var thirdCatLabel: UILabel!
    @IBOutlet weak var thirdCatNumber: UILabel!
    
    @IBOutlet weak var fourthCatLabel: UILabel!
    @IBOutlet weak var fourthCatNumber: UILabel!
    
    @IBOutlet weak var fifthCatLabel: UILabel!
    @IBOutlet weak var fifthCatNumber: UILabel!
    
    @IBOutlet weak var sixthCatLabel: UILabel!
    @IBOutlet weak var sixthCatNumber: UILabel!

    @IBOutlet weak var seventhCatLabel: UILabel!
    @IBOutlet weak var seventhCatNumber: UILabel!
    
    // Counters for the x7 categories in Contacts DB
    var counterForPrefixCode1 = Int()
    var counterForPrefixCode2 = Int()
    var counterForPrefixCode3 = Int()
    var counterForPrefixCode4 = Int()
    var counterForPrefixCode5 = Int()
    var counterForPrefixCode6 = Int()
    var counterForPrefixCode7 = Int()
    
    // Blurs to hold objects easier for AutoConstraints // ** Animation **
    @IBOutlet weak var blurBottom: UIVisualEffectView!
    @IBOutlet weak var blurMiddle: UIVisualEffectView!
    @IBOutlet weak var blurTopBig: UIVisualEffectView!    
    
    @IBOutlet weak var bottomBlurBar: UIImageView!
    @IBOutlet weak var middleBlurBar: UIImageView!
    
    @IBOutlet weak var totalContactsLabel: UILabel!
    
    @IBOutlet weak var acceleratorImageView: UIImageView!
    
    @IBOutlet weak var personalNetworkLabel: UILabel!
    
    @IBOutlet weak var spinnerImageView: UIImageView!
    
    @IBOutlet weak var SpinnerImageForeground: UIImageView!
    
    @IBOutlet weak var orangeImageView: UIImageView!
    
    
    // ** Dial Animation **
    var timerForDialOMeter = NSTimer()
    var isAnimating = false
    var counterForDialOMeter = 0
    
    // Constraint Animation Solution - For Dial-O-Meter Accelerator
    @IBOutlet weak var myViewHeight: NSLayoutConstraint!
    @IBOutlet weak var myViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var myViewLeading: NSLayoutConstraint!
    
    // ** Network Number Counter Animation **
    var timerForNetworkCount = NSTimer()
    var personalNetworkSize = Int()
    var counterForNetwork = 0
    
    
// ------------------------------------------------------
// Refresh Button to update page
    @IBAction func refreshButton(sender: AnyObject) {
        
        // GoTo 3rd VC which sends back here automatically!!
        performSegueWithIdentifier("home2Refresh", sender: nil)
        
    }
    
    
    
    
// Button to Details of Names per Category on a Different VC
    @IBAction func getNamesButton(sender: AnyObject) {
        
        performSegueWithIdentifier("home2Names", sender: nil)
    }

// ------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // *** Privacy Check ***
        let store = CNContactStore()
        switch CNContactStore.authorizationStatusForEntityType(.Contacts) {
            case .Authorized:
                loadApp()
            case .NotDetermined, .Denied:
                store.requestAccessForEntityType(.Contacts) { succeeded, err in
                    guard err == nil && succeeded else {
                        return
                    }
                }
            default:
                print("Not handled")
        } // End Switch for 'Privacy Check'
        
    } // End FUNC
    
// ------------------------------------------------------
    func loadApp() {
        // ** default vs. New Categories **
        if categoriesChosen == 0 {
            self.firstCatLabel.text = dCat1
            self.secondCatLabel.text = dCat2
            self.thirdCatLabel.text = dCat3
            self.fourthCatLabel.text = dCat4
            self.fifthCatLabel.text = dCat5
            self.sixthCatLabel.text = dCat6
            self.seventhCatLabel.text = dCat7
        }
        
        // ** Get Total contacts in Device + Count/Save per Category
        let containerId = CNContactStore().defaultContainerIdentifier()
        
        let keysToFetch = [CNContactNamePrefixKey,
                           CNContactGivenNameKey,
                           CNContactFamilyNameKey]
        
        let predicate: NSPredicate = CNContact.predicateForContactsInContainerWithIdentifier(containerId)
        
        do {
            let results = try CNContactStore().unifiedContactsMatchingPredicate(predicate, keysToFetch: keysToFetch)
            
            if results.isEmpty {
                emptyContactsAlert()
                
            } else {
                
                self.totalContactsNumber.text = String(results.count)
                
                for result in results {
                    
                    if categoriesChosen == 0 {
                        
                        switch result.namePrefix {
                        case dCatCode1:
                            print(result.givenName)
                            counterForPrefixCode1 += 1
                            
                            // Add name to Array
                            namesFor1stCatArray.append(result.givenName)
                            
                        case dCatCode2:
                            print(result.givenName)
                            counterForPrefixCode2 += 1
                            
                            namesFor2ndCatArray.append(result.givenName)
                            
                        case dCatCode3:
                            print(result.givenName)
                            counterForPrefixCode3 += 1
                            
                            namesFor3rdCatArray.append(result.givenName)
                            
                        case dCatCode4:
                            print(result.givenName)
                            counterForPrefixCode4 += 1
                            
                            namesFor4thCatArray.append(result.givenName)
                            
                        case dCatCode5:
                            print(result.givenName)
                            counterForPrefixCode5 += 1
                            
                            namesFor5thCatArray.append(result.givenName)
                            
                        case dCatCode6:
                            print(result.givenName)
                            counterForPrefixCode6 += 1
                            
                            namesFor6thCatArray.append(result.givenName)
                            
                        case dCatCode7:
                            print(result.givenName)
                            counterForPrefixCode7 += 1
                            
                            namesFor7thCatArray.append(result.givenName)
                            
                        default: break
                            // Do Nothing
                            
                        } // End SWITCH for "categoriesChosen" == 0
                        
                    } // End IF.. checking "categoriesChosen" == 0 or 1?
                    
                } // End FOR...IN... iteration to get Category Counts
                
                // ** Calculation + Show in Labels **
                let sizeOfPersonalNetwork = self.counterForPrefixCode1 + self.counterForPrefixCode2 + self.counterForPrefixCode3 + self.counterForPrefixCode4 + self.counterForPrefixCode5 + self.counterForPrefixCode6 + self.counterForPrefixCode7
                
                // update Var holding size of Personal Network
                self.personalNetworkSize = sizeOfPersonalNetwork
                print(self.personalNetworkSize)
                
                // Category Name Labels Updated
                self.firstCatNumber.text = String(self.counterForPrefixCode1)
                self.secondCatNumber.text = String(self.counterForPrefixCode2)
                self.thirdCatNumber.text = String(self.counterForPrefixCode3)
                self.fourthCatNumber.text = String(self.counterForPrefixCode4)
                self.fifthCatNumber.text = String(self.counterForPrefixCode5)
                self.sixthCatNumber.text = String(self.counterForPrefixCode6)
                self.seventhCatNumber.text = String(self.counterForPrefixCode7)
                
            } // End IF...ELSE...
            
        } catch {
            print("Error-Fetching results from Contacts Framework")
        }
        
        // Check what is in name-Arrays...
        print(namesFor1stCatArray)
        print(namesFor2ndCatArray)
        print(namesFor3rdCatArray)
        print(namesFor4thCatArray)
        print(namesFor5thCatArray)
        print(namesFor6thCatArray)
        print(namesFor7thCatArray)
        
    } // End FUNC
    
// --------------------Alerts----------------------------
    func emptyContactsAlert() {
        let alert = UIAlertController(title: "ALERT", message: "Nothing In Contacts DB", preferredStyle: .Alert) //  capital A for .Alert
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){ // or .Default
            UIAlertAction in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
// ------------------------------------------------------
    override func viewWillAppear(animated: Bool) {
        // ** Placed here vs."viewDidLayoutSubviews" **
        // ------Start Animation Sequence-------
        // ** 1st **
        self.blurBottom.alpha = 0.0
        
            self.bottomBlurBar.alpha = 0.0
            self.totalContactsLabel.alpha = 0.0
            self.totalContactsNumber.alpha = 0.0
        
        // ** 2nd **
        self.blurMiddle.alpha = 0.0
        
            self.middleBlurBar.alpha = 0.0
        
            self.firstCatLabel.alpha = 0.0
            self.secondCatLabel.alpha = 0.0
            self.thirdCatLabel.alpha = 0.0
            self.fourthCatLabel.alpha = 0.0
            self.fifthCatLabel.alpha = 0.0
            self.sixthCatLabel.alpha = 0.0
            self.seventhCatLabel.alpha = 0.0
        
            self.firstCatNumber.alpha = 0.0
            self.secondCatNumber.alpha = 0.0
            self.thirdCatNumber.alpha = 0.0
            self.fourthCatNumber.alpha = 0.0
            self.fifthCatNumber.alpha = 0.0
            self.sixthCatNumber.alpha = 0.0
            self.seventhCatNumber.alpha = 0.0
        
        // ** 3rd **
        self.blurTopBig.alpha = 0.0
        
            self.personalNetworkLabel.alpha = 0.0
            self.spinnerImageView.alpha = 0.0
            self.SpinnerImageForeground.alpha = 0.0
            self.totalPersonalNetworkNumber.alpha = 0.0
        
            self.orangeImageView.alpha = 0.0
        
            self.acceleratorImageView.alpha = 0.0       //  Dial-o-meter
            self.myViewHeight.constant = 150            //  Constraints Animat.for Dial-o-meter
            self.myViewTrailing.constant = 100
            self.myViewLeading.constant = 100
    }
    
// ** Animations ** //
    override func viewDidAppear(animated: Bool) {
        
        // Main 3 Blur - to Alpha 1.0
        self.blurBottom.alpha = 1.0
        self.blurMiddle.alpha = 1.0
        self.blurTopBig.alpha = 1.0
        
        //  XCode Message: For Above Alpha change
        //  2016-05-31 12:28:28.624 MyNetwork[819:258064] <UIVisualEffectView 0x1556556b0> is being asked to animate its opacity. This will cause the effect to appear broken until opacity returns to 1.
        
        
        // ** Placed here vs."viewDidLayoutSubviews" **
        // ------Start Animation Sequence-------
        // ** 1st **
        self.blurBottom.center = CGPointMake(self.blurBottom.center.x, self.blurBottom.center.y + 800)
     
        // ** 2nd **
        self.blurMiddle.center = CGPointMake(self.blurMiddle.center.x, self.blurMiddle.center.y + 400)
        
        // ** 3rd **
        self.blurTopBig.center = CGPointMake(self.blurTopBig.center.x, self.blurTopBig.center.y + 800)
        
        
        // ------Continue Animation Sequence------
        // ** 1st **
        UIView.animateWithDuration(1.0, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            
            self.blurBottom.center = CGPointMake(self.blurBottom.center.x, self.blurBottom.center.y - 800)
            
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.2, options: [], animations: {
            
            self.bottomBlurBar.alpha = 1.0
            
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.5, options: [], animations: {
            
            self.totalContactsLabel.alpha = 1.0
            
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.5, options: [], animations: {
            
            self.totalContactsNumber.alpha = 1.0
            
            }, completion: nil)
        
        // ** 2nd **
        UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: [], animations: {
            
            self.blurMiddle.center = CGPointMake(self.blurMiddle.center.x, self.blurMiddle.center.y - 400)
            }, completion: nil)

        UIView.animateWithDuration(1.0, delay: 0.6, options: [], animations: {
            
            self.middleBlurBar.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.7, options: [], animations: {
            // Animate All Names of Categories
            
            self.firstCatLabel.alpha = 1.0
            self.secondCatLabel.alpha = 1.0
            self.thirdCatLabel.alpha = 1.0
            self.fourthCatLabel.alpha = 1.0
            self.fifthCatLabel.alpha = 1.0
            self.sixthCatLabel.alpha = 1.0
            self.seventhCatLabel.alpha = 1.0
            
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.8, options: [], animations: {
            // Animate All Category Numbers
            
            self.firstCatNumber.alpha = 1.0
            self.secondCatNumber.alpha = 1.0
            self.thirdCatNumber.alpha = 1.0
            self.fourthCatNumber.alpha = 1.0
            self.fifthCatNumber.alpha = 1.0
            self.sixthCatNumber.alpha = 1.0
            self.seventhCatNumber.alpha = 1.0
            
            }, completion: nil)
        
        // ** 3rd **
        UIView.animateWithDuration(1.0, delay: 0.9, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: [], animations: {
            // BLUR-TOP
            
            self.blurTopBig.center = CGPointMake(self.blurTopBig.center.x, self.blurTopBig.center.y - 800)
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 1.0, options: [], animations: {
            // TEXT-LABEL
            
            self.personalNetworkLabel.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 1.2, options: [], animations: {
            // NUMBER-COUNTER + Spinner image (BASIC)
            
            self.totalPersonalNetworkNumber.alpha = 1.0
            self.spinnerImageView.alpha = 1.0
            self.SpinnerImageForeground.alpha = 1.0
            }, completion: nil)

        
        UIView.animateWithDuration(1.0, delay: 1.4, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: {
            // DIAL-O-METER
                self.acceleratorImageView.alpha = 1.0
            
                self.myViewHeight.constant = 20
                self.myViewTrailing.constant = 20
            
                self.myViewLeading.constant = 20
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        
        // ** Dial-O-Meter Animation Start **
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.startDialAnimation), userInfo: nil, repeats: false)
        
        // *** ROTATION ***
        UIView.animateWithDuration(3.0, delay: 2.0, options: [.CurveLinear], animations: {
            
            // Nested FUNC for spinning - options: [.CurveLinear] in Animation Block
            func spinnerRotate() {
                self.spinnerImageView.transform = CGAffineTransformRotate(self.spinnerImageView.transform, CGFloat(M_PI))   // (M_PI_2) = 90 degrees, (M_PI) = 180 degrees
            }
                spinnerRotate()     // x3 full circles with x6 Funcs called !!!
                spinnerRotate()
                spinnerRotate()
                spinnerRotate()
                spinnerRotate()
                spinnerRotate()
            }, completion: nil)
        
        // FINALE!! - 3D image behind Tot.No. of Personal Contacts
        UIView.animateWithDuration(3.0, delay: 2.5, options: [], animations: {
            
            self.orangeImageView.alpha = 0.8
            
            }, completion: nil)
        
    } // End ViewDidAppear FUNC
    
// ------------------------------------------------------
    func startDialAnimation() {
        
        timerForDialOMeter = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(ViewController.doAnimationDial), userInfo: nil, repeats: true)
    }
    
// ------------------------------------------------------
    func doAnimationDial() {
        // ** Both Dial + Counter Animation **
        if counterForDialOMeter == self.personalNetworkSize {   // Max counter no.
            timerForDialOMeter.invalidate()                     // Stop Dial movement
        } else {
            self.counterForDialOMeter += 1                      // Dial-o-Meter Animat.
            self.counterForNetwork += 1                         // No.Count Animat.
        }
        self.acceleratorImageView.image = UIImage(named: "D-\(counterForDialOMeter)")
        self.totalPersonalNetworkNumber.text = "\(counterForNetwork)"
    }
    
// ------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

