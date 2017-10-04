//
//  ViewController.swift
//  lab3
//
//  Created by Maitri Chattopadhyay on 9/28/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var shapeLabel: UILabel!
   
    @IBOutlet weak var BMI: UILabel!
    
    @IBOutlet weak var yearsOfLife: UILabel!
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var LifeLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heigthLabel: UILabel!
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
   
    @IBOutlet weak var goBackHide: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func goBack(_ sender: UIButton)
    {
        BMILabel.isHidden = true
        LifeLabel.isHidden = true
         goBackHide.isHidden = true
        yearsOfLife.isHidden = true
        BMI.isHidden = true
        shapeLabel.isHidden = true
       
        
        // setting the values to default
        height.text = nil
        weight.text = nil
        userName.text = nil
        
        heigthLabel.isHidden = false
        weightLabel.isHidden = false
        height.isHidden = false
        weight.isHidden = false
        submithide.isHidden = false
         nameLabel.isHidden = false
        userName.isHidden = false
        
        
        
    }
    
    func alerts()
    {
        
        let alert = UIAlertController(title: "Error", message: "All the three fields should be filled before proceeding", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        present (alert, animated: true, completion:  nil)

    }
    
    @IBAction func submit(_ sender: UIButton)
    {
        if height.text!.isEmpty || weight.text!.isEmpty || userName.text!.isEmpty
        {
            alerts()
        }
        
        else
        {
            var BMIcalc : Float
               BMIcalc = Float(weight.text!)! / Float(height.text!)! / Float(height.text!)!
            
       
            let life = Int (Double (BMIcalc) * 10)
            
            
            LifeLabel.isHidden = false
            BMILabel.isHidden = false
            BMI.isHidden = false
            yearsOfLife.isHidden = false
            goBackHide.isHidden = false
            shapeLabel.text = "you are in great shape " + userName.text! + " ! "
            shapeLabel.isHidden = false
            
            heigthLabel.isHidden = true
            weightLabel.isHidden = true
            submithide.isHidden = true
            height.isHidden = true
            weight.isHidden = true
            nameLabel.isHidden = true
            userName.isHidden = true
            
            
            self.BMI.text = String (BMIcalc)
           yearsOfLife.text = String (life) + " years"
           //self.yearsOfLife = String (lifeExpectancy)
            
            
            
        }
        
    }
    @IBOutlet weak var submithide: UIButton!
    
   override func viewDidAppear(_ animated: Bool) {
    
        LifeLabel.isHidden = true
        BMILabel.isHidden = true
        BMI.isHidden = true
        yearsOfLife.isHidden = true
        goBackHide.isHidden = true
        shapeLabel.isHidden = true
    }
    
    override func viewDidLoad() {
        // for the keyboard. the fields promping the keyboard
        height.delegate = self
        weight.delegate = self
        userName.delegate = self
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // action to dismiss the keyboard when the user taps anywhere on the screen
   /* @IBAction func onTapGestureRecognized(sender: AnyObject)
    {
        height.resignFirstResponder()
        weight.resignFirstResponder()
    }*/
}

