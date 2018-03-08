//
//  ViewController.swift
//  project1.0
//
//  Created by Maitri Chattopadhyay on 3/2/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dailyHororscope: UILabel!
     var dailyLabel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var share: UIBarButtonItem!
    override func viewWillAppear(_ animated: Bool) {
        
        //dailyLabel = "maitri"
            dailyHororscope.text = dailyLabel
        }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

