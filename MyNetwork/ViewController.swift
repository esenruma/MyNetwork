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
    
    // Stored names-Arrays of results of network Count per Category
    var namesFor1stCatArray = [String]()        // ================
    var namesFor2ndCatArray = [String]()        // ================
    var namesFor3rdCatArray = [String]()        // ================
    var namesFor4thCatArray = [String]()        // ================
    var namesFor5thCatArray = [String]()        // ================
    var namesFor6thCatArray = [String]()        // ================
    var namesFor7thCatArray = [String]()        // ================
    // ==== What to do with these Stored Names? - into 3rd VC - Table??? ====
    
    
    // ------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadApp()
    }

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
                            self.namesFor1stCatArray.append(result.givenName)
                            
                        case dCatCode2:
                            print(result.givenName)
                            counterForPrefixCode2 += 1
                            
                            self.namesFor2ndCatArray.append(result.givenName)
                            
                        case dCatCode3:
                            print(result.givenName)
                            counterForPrefixCode3 += 1
                            
                            self.namesFor3rdCatArray.append(result.givenName)
                            
                        case dCatCode4:
                            print(result.givenName)
                            counterForPrefixCode4 += 1
                            
                            self.namesFor4thCatArray.append(result.givenName)
                            
                        case dCatCode5:
                            print(result.givenName)
                            counterForPrefixCode5 += 1
                            
                            self.namesFor5thCatArray.append(result.givenName)
                            
                        case dCatCode6:
                            print(result.givenName)
                            counterForPrefixCode6 += 1
                            
                            self.namesFor6thCatArray.append(result.givenName)
                            
                        case dCatCode7:
                            print(result.givenName)
                            counterForPrefixCode7 += 1
                            
                            self.namesFor7thCatArray.append(result.givenName)
                            
                        default: break
                            // Do Nothing
                            
                        } // End SWITCH for "categoriesChosen" == 0
                        
                    } // End IF.. checking "categoriesChosen" == 0 or 1?
                    
                } // End FOR...IN... iteration to get Category Counts
                
                // ** Calculation + Show in Labels **
                let sizeOfPersonalNetwork = self.counterForPrefixCode1 + self.counterForPrefixCode2 + self.counterForPrefixCode3 + self.counterForPrefixCode4 + self.counterForPrefixCode5 + self.counterForPrefixCode6 + self.counterForPrefixCode7
                
                self.totalPersonalNetworkNumber.text = String(sizeOfPersonalNetwork)
                
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

