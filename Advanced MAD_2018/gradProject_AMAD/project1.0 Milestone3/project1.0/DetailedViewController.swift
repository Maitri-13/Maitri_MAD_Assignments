//
//  ViewController.swift
//  project1.0
//
//  Created by Maitri Chattopadhyay on 3/2/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var dailyHororscope: UILabel!
    var dailyLabel = String()
    
    var careerhoror = String()
    var healthhoror = String()

    // No permission is needed for the sarari access
    @IBAction func career(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: careerhoror)!, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func money(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: healthhoror)!, options: [:], completionHandler: nil)
    }
    
    
    @IBOutlet weak var sign: UILabel!
    var signLabel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var share: UIBarButtonItem!
    override func viewWillAppear(_ animated: Bool) {
         
        dailyHororscope.text = dailyLabel
        sign.text = signLabel
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


