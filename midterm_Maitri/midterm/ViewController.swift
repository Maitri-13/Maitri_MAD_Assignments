//
//  ViewController.swift
//  midterm
//
//  Created by Maitri Chattopadhyay on 10/19/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    var user = ModelFile()
    
    let filename = "fav.plist"
    
  
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    
    @IBOutlet weak var numberOfMilesEntered: UITextField!
    
    @IBOutlet weak var monthlySwitch: UISwitch!
    
    
    @IBOutlet weak var gasLevelSlider: UISlider!
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var selectorSegment: UISegmentedControl!
    @IBOutlet weak var gasIndicator: UILabel!
   
    @IBOutlet weak var gasNeeded: UILabel!
    
    @IBOutlet weak var commuteTime: UILabel!
    
    
    @IBAction
   func unwindSegue(_ segue:UIStoryboardSegue)
    {
        name.text = user.name
        email.text = user.email
        
    }
    
    // this function is used to get the path of the file that we wrote in to
    func docFilePath(_ filename: String) -> String?
    {
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString
        return dir.appendingPathComponent(filename)
    }

    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if textField == numberOfMilesEntered
        {
            let miles = Int (textField.text!)!
            if miles > 50
            {
                
                    let alert = UIAlertController(title: "Alert", message: "Your are commuting over 50 miles!", preferredStyle: UIAlertControllerStyle.alert)
                    let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
                    alert.addAction(okAction)
                    present (alert, animated: true, completion:  nil)
                    
            
            }
        
        }
    }
    
    func calculation(){
    
        if  selectorSegment.selectedSegmentIndex==0
        {
            
                
                let temp = Int (numberOfMilesEntered.text!)! * 60
                   let calculatedValue = Int (temp) / 20
            
            if calculatedValue < 60
            {
            commuteTime.text = String (calculatedValue) + " mins"
            }
            else if calculatedValue == 60
            {
            commuteTime.text = String (calculatedValue) + " mins"
            }
            else{
             let hours = calculatedValue * 60
                commuteTime.text = String(hours) + " mins"
            }
            
            gasNeeded.text = String(24 * Float(numberOfMilesEntered.text!)!) + "gallons"
        }
            
        else  if selectorSegment.selectedSegmentIndex==1
        {
            let temp = Int (numberOfMilesEntered.text!)! * 60
            let calculatedValue1 = Int (temp) / 12
            let calculatedValue = calculatedValue1 + 10
            
            
            if calculatedValue < 60
            {
                commuteTime.text = String (calculatedValue) + " mins"
            }
            else if calculatedValue == 60
            {
                commuteTime.text = String (calculatedValue) + " mins"
            }
            else{
                let hours = calculatedValue * 60
                commuteTime.text = String(hours) + " mins"
            }

            gasNeeded.text = String(24 * Float(numberOfMilesEntered.text!)!) + "gallons"
        }
        
        else
        
        {
            let temp = Int (numberOfMilesEntered.text!)! * 60
            let calculatedValue = Int (temp) / 10
            
            if calculatedValue < 60
            {
                commuteTime.text = String (calculatedValue) + " mins"
            }
            else if calculatedValue == 60
            {
                commuteTime.text = String (calculatedValue) + " mins"
            }
            else{
                let hours = calculatedValue * 60
                commuteTime.text = String(hours) + " mins"
            }
            gasNeeded.text = " 0 gallons"
        }
    
    }
    
    @IBAction func commuteButton(_ sender: UIButton)
    {
            calculation()
    }
    
   
    func monthly(){
    
    if monthlySwitch.isOn
    {
        // chage the commute time and the gas needed
        
    }
        
    
    }
    
    @IBAction func gasLevelSliderFunction(_ sender: UISlider) {
        
        let fontSize = sender.value
        
        gasIndicator.text = "Gas in tank" + String(format: "%.0f", fontSize) + " gallons"// display the font size being selected
        
    }
  
    
    @IBAction func selectroSegmentFunction(_ sender: UISegmentedControl) {
        changeImage()
    }
    
    
    func changeImage(){
       
        if selectorSegment.selectedSegmentIndex==0 // this number can be given in the attribute inspectors=
        {
            
           calculation()
            picture.image = UIImage(named: "car") // dynamically change picture
        }
            
        else if selectorSegment.selectedSegmentIndex==1
        {
            calculation()
            
            picture.image = UIImage(named: "bus")
        }
        else
        {
            calculation()
            picture.image = UIImage(named: "bike")
        }
 
        
    }
    
    // keyboard dissapear when tapped anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    // keyboard disapear when tappen on the return/done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    
    override func viewDidLoad()
    {
        numberOfMilesEntered.delegate = self
        
        
        let filePath = docFilePath(filename)
        
        
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            
            let dataDictionary = NSDictionary(contentsOfFile: path!) as! [String:String]
            
            // checks if the dictionary contains the key
            if dataDictionary.keys.contains("name") {
                // fectches the data that is stored in that key.
                user.name = dataDictionary["name"]
                // writes that data into the lable on the story board
                name.text=user.name
            }
           
            if dataDictionary.keys.contains("email") {
                // fectches the data that is stored in that key.
                user.email = dataDictionary["email"]
                // writes that data into the lable on the story board
                email.text=user.email
            }
        }
        
        
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
        super.viewDidLoad()
    }

    
    func applicationWillResignActive(_ notification: Notification)
    {
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        
        if user.name != nil
        {
            data.setValue(user.name, forKey: "name")
            
        }
        if user.email != nil
        {
            data.setValue(user.email, forKey: "email")
        }
        
        data.write(toFile: filePath!, atomically: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

