//
//  ViewController.swift
//  homePage
//
//  Created by Maitri Chattopadhyay on 9/28/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
   

 
    @IBOutlet weak var newGoalLabel: UITextField!
    @IBOutlet weak var newGoalDescription: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var repeatDaily: UIButton!
    @IBOutlet weak var repeatForever: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "saveAndGoBack")
            {
                let destination = segue.destination as! TableViewController
                
                // storing the vlaues in the model file
                if newGoalLabel.text!.isEmpty == false
                {
                    destination.user.title = newGoalLabel.text
                }
                else
                {
                    //alert if new goal in empty
                     let alert = UIAlertController(title: "Error", message: "Goal name cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
                        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
                        alert.addAction(okAction)
                        present (alert, animated: true, completion:  nil)

                }
                if newGoalDescription.text!.isEmpty == false
                {
                    destination.user.description = newGoalDescription.text
                }
                if date.text!.isEmpty == false
                {
                    destination.user.startDate= date.text
                }
                if time.text!.isEmpty == false
                {
                    destination.user.startTime = time.text
                }
                
                // these two are buttons. Have to store the names ofthe bittons.
                if repeatDaily.currentTitle!.isEmpty == false
                {
                    destination.user.repeatationWeekly = repeatDaily.currentTitle
                }
                if repeatForever.currentTitle!.isEmpty == false
                {
                    destination.user.repeatationForever = repeatForever.currentTitle
                }
                
            }
        if segue.identifier == "cancelGoBack"
        {
            // simply take back. no action taken.
            let destination = segue.destination as! TableViewController
        }
        
    }
    
    
    // for the keyboard going away
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func dailyButton(_ sender: UIButton) {
        
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        //Daily
        let daily = UIAlertAction(title: "Daily", style: UIAlertActionStyle.default, handler:  { action in sender.setTitle("Weekly", for:.normal)})
        alert.addAction(daily)
        // Weekly
        let onceWeek = UIAlertAction(title: "Once a week", style: UIAlertActionStyle.default, handler:  { action in sender.setTitle("Weekly", for:.normal)})
        alert.addAction(onceWeek)
        // monthly
        let onceMonth = UIAlertAction(title: "Once a month", style: UIAlertActionStyle.default, handler: { action in sender.setTitle("Monthly", for:.normal)})
        alert.addAction(onceMonth)
        // yearly
        let onceYear = UIAlertAction(title: "Once a year", style: .default, handler: { action in sender.setTitle("Yearly", for:.normal)})
        alert.addAction(onceYear)
        
        present (alert, animated: true, completion:  nil)
        
        

    }
    
    
    
    @IBAction func foreverButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        //forever
        let forever = UIAlertAction(title: "forever", style: UIAlertActionStyle.default, handler:  { action in sender.setTitle("Forever", for:.normal)})
        alert.addAction(forever)
       // for a maonth
        let forAMonth = UIAlertAction(title: "for a month", style: UIAlertActionStyle.default, handler:  { action in sender.setTitle("For a month", for:.normal)})
        alert.addAction(forAMonth)
        
       
        // for a year
        let forAYear = UIAlertAction(title: "for a year", style: .default, handler: { action in sender.setTitle("For a a year", for:.normal)})
        alert.addAction(forAYear)
        
        present (alert, animated: true, completion:  nil)
        
    }
    
    
    override func viewDidLoad()
    {
        newGoalLabel.delegate = self
       newGoalDescription.delegate = self
         date.delegate = self
         time.delegate = self 
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

