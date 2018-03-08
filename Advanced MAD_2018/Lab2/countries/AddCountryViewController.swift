//
//  CollectionViewController.swift
//  countries
//
//  Created by Maitri Chattopadhyay on 2/23/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//



import UIKit

class AddCountryViewController: UIViewController {
    @IBOutlet weak var countryTextfield: UITextField!
    var addedCountry = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue"{
            if ((countryTextfield.text?.isEmpty) == false){
                addedCountry=countryTextfield.text!
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
