//
//  SecondViewController.swift
//  maitri_exam
//
//  Created by Maitri Chattopadhyay on 3/15/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   
    @IBOutlet var addLabel: UITextField!
    var newthing = String()
    
    @IBOutlet var addUrl: UITextField!
    var newUrl = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
// This tells what dato to send to the other page from thsi page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "donesegue"{
            //only add a country if there is text in the textfield
            if ((addLabel.text?.isEmpty) == false){
                newthing=addLabel.text!
                
            }
            if (addUrl.text?.isEmpty == false){
                newUrl = addUrl.text!
            }
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
