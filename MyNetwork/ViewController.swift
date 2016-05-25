//
//  ViewController.swift
//  MyNetwork
//
//  Created by Roma on 25/05/2016.
//  Copyright © 2016 esenruma. All rights reserved.
//

import UIKit
import Contacts

var categoriesChosen = 0        // 0 = Default, 1 = new Categories


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
    
    
    var counterForPrefixCode1 = Int()
    var counterForPrefixCode2 = Int()
    var counterForPrefixCode3 = Int()
    var counterForPrefixCode4 = Int()
    var counterForPrefixCode5 = Int()
    var counterForPrefixCode6 = Int()
    var counterForPrefixCode7 = Int()
    
    // Stored names of results of network Analysis
    var namesFor1stCat = [String]()
    var namesFor2ndCat = [String]()
    var namesFor3rdCat = [String]()
    var namesFor4thCat = [String]()
    var namesFor5thCat = [String]()
    var namesFor6thCat = [String]()
    var namesFor7thCat = [String]()
    
// ------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if categoriesChosen == 0 {
            self.firstCatLabel.text = dCat1
            self.secondCatLabel.text = dCat2
            self.thirdCatLabel.text = dCat3
            self.fourthCatLabel.text = dCat4
            self.fifthCatLabel.text = dCat5
            self.sixthCatLabel.text = dCat6
            self.seventhCatLabel.text = dCat7
        }
        
        // ** Call Total contacts in Device ** [Count]
        let containerId = CNContactStore().defaultContainerIdentifier()
        
        let keysToFetch = [CNContactNamePrefixKey,
                           CNContactGivenNameKey,
                           CNContactFamilyNameKey]
        
        let predicate: NSPredicate = CNContact.predicateForContactsInContainerWithIdentifier(containerId)
        
        do {
            let results = try CNContactStore().unifiedContactsMatchingPredicate(predicate, keysToFetch: keysToFetch)
            
            if results.isEmpty {
                print("nothing in Contacts")
                
            } else {
                self.totalContactsNumber.text = String(results.count)
                for result in results {
                    
                    switch result.namePrefix {
                    case dCatCode1:
                        print(result.givenName)
                        counterForPrefixCode1 += 1
                        
                        // Add name to Array
                        self.namesFor1stCat.append(result.givenName)
                       
                    case dCatCode2:
                        print(result.givenName)
                        counterForPrefixCode2 += 1
                        
                        self.namesFor2ndCat.append(result.givenName)
                        
                    case dCatCode3:
                        print(result.givenName)
                        counterForPrefixCode3 += 1
                        
                        self.namesFor3rdCat.append(result.givenName)
                        
                    case dCatCode4:
                        print(result.givenName)
                        counterForPrefixCode4 += 1
                    
                        self.namesFor4thCat.append(result.givenName)
                        
                    case dCatCode5:
                        print(result.givenName)
                        counterForPrefixCode5 += 1
                        
                        self.namesFor5thCat.append(result.givenName)
                        
                    case dCatCode6:
                        print(result.givenName)
                        counterForPrefixCode6 += 1
                        
                        self.namesFor6thCat.append(result.givenName)
                        
                    case dCatCode7:
                        print(result.givenName)
                        counterForPrefixCode7 += 1
                        
                        self.namesFor7thCat.append(result.givenName)
                        
                    default: break
                        // Do Nothing
                        
                    } // End SWITCH
                    
                } // End FOR...IN...
                
                let sizeOfPersonalNetwork = self.counterForPrefixCode1 + self.counterForPrefixCode2 + self.counterForPrefixCode3 + self.counterForPrefixCode4 + self.counterForPrefixCode5 + self.counterForPrefixCode6 + self.counterForPrefixCode7
                
                self.totalPersonalNetworkNumber.text = String(sizeOfPersonalNetwork)
                
                self.firstCatNumber.text = String(self.counterForPrefixCode1)
                self.secondCatNumber.text = String(self.counterForPrefixCode2)
                self.thirdCatNumber.text = String(self.counterForPrefixCode3)
                self.fourthCatNumber.text = String(self.counterForPrefixCode4)
                self.fifthCatNumber.text = String(self.counterForPrefixCode5)
                self.sixthCatNumber.text = String(self.counterForPrefixCode6)
                self.seventhCatNumber.text = String(self.counterForPrefixCode7)
                
                print(self.namesFor1stCat)
            
            } // End IF...ELSE...
            
        } catch {
        }

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

