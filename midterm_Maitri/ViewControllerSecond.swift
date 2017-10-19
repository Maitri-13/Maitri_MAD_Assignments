//
//  ViewControllerSecond.swift
//  midterm
//
//  Created by Maitri Chattopadhyay on 10/19/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ViewControllerSecond: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameEntered: UITextField!
    
    @IBOutlet weak var emailEntered: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
            // setting destination as previous page. this is where this segway will take you
            let destination = segue.destination as! ViewController
        if nameEntered.text!.isEmpty == false
        {
            destination.user.name = nameEntered.text
        }
        if emailEntered.text!.isEmpty == false
        {
            destination.user.email = emailEntered.text
        }
        
        
    }
    
    // keyboard disapear when tappen on the return/done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
    
     override func viewDidLoad() {
    
       nameEntered.delegate = self
        emailEntered.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


}
