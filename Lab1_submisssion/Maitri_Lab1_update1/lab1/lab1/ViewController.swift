//
//  ViewController.swift
//  lab1
//
//  Created by Maitri Chattopadhyay on 9/6/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CollegeInfo: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    @IBAction func butttonPressed(_ sender: UIButton) {
        
        
        if sender.tag == 0
        {
            image.image = UIImage (named: "usa")
            CollegeInfo.text = ""
            //collegeInfo.isEnabled = false
        }
        
        if sender.tag == 1
        {
            image.image = UIImage (named: "cu")
            CollegeInfo.text = "it was founded in the year 2000 with 20 students "
            //   collegeInfo.isEnabled = true
        }
        if sender.tag == 2
        {
            image.image = UIImage (named: "penn")
            CollegeInfo.text = "it was founded in the year 2010. Fairly new college"
            //collegeInfo.isEnabled = true
            
        }
        
        if sender.tag == 3
        {
            image.image = UIImage (named: "stoney")
            CollegeInfo.text = "it was founded in the year 2015.  "
            // collegeInfo.isEnabled = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

