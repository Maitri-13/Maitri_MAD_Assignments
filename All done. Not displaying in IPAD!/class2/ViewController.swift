//
//  ViewController.swift
//  class2
//
//  Created by Maitri Chattopadhyay on 9/14/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var captialSwitch: UISwitch!
    @IBOutlet weak var titleMain: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var sizeIndicator: UILabel!
    @IBOutlet weak var imageChanger: UISegmentedControl!
    
    
    
    func capsOn()
    {
        if captialSwitch.isOn{
            titleMain.text = titleMain.text?.uppercased()
        }
        else
        {
            titleMain.text = titleMain.text?.lowercased()
        }
    }
    func changeImage()
    {
        if imageChanger.selectedSegmentIndex==0
        {
            
            titleMain.text="Its a unicorn!!"
            picture.image = UIImage(named: "uni")
        }
        else if imageChanger.selectedSegmentIndex==1
        {
            
            titleMain.text="Its a kitty!!"
            picture.image = UIImage(named: "cat")
        }
        else
        {
            
            titleMain.text="Its a dog!!"
            // titleMain.text = titleMain.text?.lowercased()
            picture.image = UIImage(named: "dog")
        }
    }
    
    @IBAction func fontChange(_ sender: UISwitch)
    {
        capsOn()
    }
    
    @IBAction func titleChanger(_ sender: UISegmentedControl)
    {
        changeImage()
        capsOn() // first change the text then make it caps
    
    } // function

    @IBAction func slider(_ sender: UISlider) {
        
        let fontSize = sender.value
        let fontsizeFloat = CGFloat(fontSize)
        sizeIndicator.text = String(format: "%.0f", fontSize)
        titleMain.font = UIFont.systemFont(ofSize: fontsizeFloat)
        
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

