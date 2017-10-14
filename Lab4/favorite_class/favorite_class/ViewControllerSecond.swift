//
//  ViewControllerSecond.swift
//  favorite_class
//
//  Created by Maitri Chattopadhyay on 10/3/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ViewControllerSecond: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var authorText: UITextField!
    @IBOutlet weak var bookText: UITextField!
    @IBOutlet weak var tvShowTexgt: UITextField!
    
    
    // the function makes the keyboard away when the user clicks anywhere else on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }

    // segue funstion
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
        if segue.identifier == "goBack"
            {
                // setting destination as previous page. this is where this segway will take you
                let destination = segue.destination as! ViewController
                
                // storing the vlaues in the model file
                if bookText.text!.isEmpty == false
                {
                    destination.user.favBook = bookText.text
                }
                if authorText.text!.isEmpty == false
                {
                    destination.user.favAuthor = authorText.text
                }
                if tvShowTexgt.text!.isEmpty == false
                {
                    destination.user.favTvShow = tvShowTexgt.text
                }
            }
    }
    // for the done button to get rid of the keyboards
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    override func viewDidLoad()
    {
        authorText.delegate = self
        bookText.delegate = self
        tvShowTexgt.delegate = self
      
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}
