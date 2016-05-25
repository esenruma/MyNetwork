//
//  SettingsViewController.swift
//  MyNetwork
//
//  Created by Roma on 25/05/2016.
//  Copyright © 2016 esenruma. All rights reserved.
//

import UIKit
import Contacts

// -----------default-Categories--------------------------
let dCat1 = "Friends"               // F.
let dCatCode1 = "F."

let dCat2 = "Family"                // fam.
let dCatCode2 = "fam."

let dCat3 = "Work"                  // w.
let dCatCode3 = "w."

let dCat4 = "Alumni"                  // al.
let dCatCode4 = "al."

let dCat5 = "Social"                // s.
let dCatCode5 = "s."

let dCat6 = "Inner Circle"          // in.
let dCatCode6 = "in."

let dCat7 = "Personal Advisor"      // ad.
let dCatCode7 = "ad."

// ------------------------------------------------------
// ** For New Inputed Categories **
var newFirstCat = String()
var newFirstCode = String()

var newSecondCat = String()
var newSecondCode = String()

var newThirdCat = String()
var newThirdCode = String()

var newFourthCat = String()
var newFourthCode = String()

var newFifthCat = String()
var newFifthCode = String()

var newSixthCat = String()
var newSixthCode = String()

var newSeventhCat = String()
var newSeventhCode = String()

// ------------------------------------------------------
class SettingsViewController: UIViewController {

    // ** Inputs for new Categories + Codes **
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var firstCodeField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var secondCodeField: UITextField!
    
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var thirdCodeField: UITextField!
    
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fourthCodeField: UITextField!
    
    @IBOutlet weak var fifthTextField: UITextField!
    @IBOutlet weak var fifthCodeField: UITextField!
    
    @IBOutlet weak var sixthTextField: UITextField!
    @IBOutlet weak var sixthCodeField: UITextField!
    
    @IBOutlet weak var seventhTextField: UITextField!
    @IBOutlet weak var seventhCodeField: UITextField!
    
    
    @IBAction func saveNewCategories(sender: AnyObject) {
        
        // Check if All x7 Cats + Codes TextFields are filled
        if self.firstTextField.text == "" || self.firstCodeField.text == ""
            || self.secondTextField.text == "" || self.secondCodeField.text == ""
            || self.thirdTextField.text == "" || self.thirdCodeField.text == ""
            || self.fourthTextField.text == "" || self.fourthCodeField.text == ""
            
            || self.fifthTextField.text == "" || self.fifthCodeField.text == ""
            || self.sixthTextField.text == "" || self.sixthCodeField.text == ""
            || self.seventhTextField.text == "" || self.seventhCodeField.text == "" {
            
            print("Do Alert")
            textFieldAlert()      // Alert
            
        } else {
        
            // Save new TextFieldInputs to Vars
            textFieldsIntoVars()
        
            // Save these Categories + Codes into NSUserDefaults
            saveVarsIntoNSuserDefaults()
        
            // Change State of Categories Chosen
            categoriesChosen = 1                // 0 = Default, 1 = new Categories
        
        }  // End IF
        
    }  // End FUNC
    
    func textFieldAlert() {
        let alert = UIAlertController(title: "ALERT", message: "Need to fill in Blank Fields", preferredStyle: .Alert) //  capital A for .Alert
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel){ // or .Default
            UIAlertAction in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    // ------------------------------------------------------
    func textFieldsIntoVars() {
        newFirstCat = self.firstTextField.text!
        newFirstCode = self.firstCodeField.text!
        
        newSecondCat = self.secondTextField.text!
        newSecondCode = self.secondCodeField.text!
        
        newThirdCat = self.thirdTextField.text!
        newThirdCode = self.thirdCodeField.text!
        
        newFourthCat = self.fourthTextField.text!
        newFourthCode = self.fourthCodeField.text!
        
        newFifthCat = self.fifthTextField.text!
        newFifthCode = self.fifthCodeField.text!
        
        newSixthCat = self.sixthTextField.text!
        newSixthCode = self.sixthCodeField.text!
        
        newSeventhCat = self.seventhTextField.text!
        newSeventhCode = self.seventhCodeField.text!
    }
    
    // ------------------------------------------------------
    func saveVarsIntoNSuserDefaults() {
        NSUserDefaults.standardUserDefaults().setObject(newFirstCat, forKey: "newFirstCat")
        NSUserDefaults.standardUserDefaults().setObject(newFirstCode, forKey: "newFirstCode")
        
        NSUserDefaults.standardUserDefaults().setObject(newSecondCat, forKey: "newSecondCat")
        NSUserDefaults.standardUserDefaults().setObject(newSecondCode, forKey: "newSecondCode")
        
        NSUserDefaults.standardUserDefaults().setObject(newThirdCat, forKey: "newThirdCat")
        NSUserDefaults.standardUserDefaults().setObject(newThirdCode, forKey: "newThirdCode")
        
        NSUserDefaults.standardUserDefaults().setObject(newFourthCat, forKey: "newFourthCat")
        NSUserDefaults.standardUserDefaults().setObject(newFourthCode, forKey: "newFourthCode")
        
        NSUserDefaults.standardUserDefaults().setObject(newFifthCat, forKey: "newFifthCat")
        NSUserDefaults.standardUserDefaults().setObject(newFifthCode, forKey: "newFifthCode")
        
        NSUserDefaults.standardUserDefaults().setObject(newSixthCat, forKey: "newSixthCat")
        NSUserDefaults.standardUserDefaults().setObject(newSixthCode, forKey: "newSixthCode")
        
        NSUserDefaults.standardUserDefaults().setObject(newSeventhCat, forKey: "newSeventhCat")
        NSUserDefaults.standardUserDefaults().setObject(newSeventhCode, forKey: "newSeventhCode")
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
    @IBAction func activateDefaultCategories(sender: AnyObject) {
        
        categoriesChosen = 0        // 0 = Default, 1 = new Categories
    }
    
    
    
// ------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
