//
//  FirstViewController.swift
//  Music
//
//  Created by Maitri Chattopadhyay on 1/25/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

// INDEPENDENT PICKER EXAMPLE
class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var musicPicker: UIPickerView!
    
    let genre = ["classical", "folk", "rock", "rap"]
    let decade = ["1993s", "1234s", "1267s", "8973s"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2; // components is the column
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (component == 0) // component number starts from 0
        {
            return genre.count
        }
        else{
            return decade.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) // component number starts from 0
        {
            return genre[row]  // this displays the data you want to diplay
        }
        else{
            return decade[row]
        }
    }

    // this handles what happens when you select something in it
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let genrerow = pickerView.selectedRow(inComponent: 0) // gets the row selected for genre
            let decaderow = pickerView.selectedRow(inComponent: 1) // gets the row selected for decade
        
        choiceLabel.text = "You selected \(genre[genrerow]) in \(decade[decaderow])."
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

