//
//  SecondViewController.swift
//  Music
//
//  Created by Maitri Chattopadhyay on 1/25/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

// DEPENDENT PICKER VIEW. TAKES DATA FROM P LIST
class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var musicPicker: UIPickerView!

    // assigned the column/component number to variables
    let artistComponent = 0;
    let albumComponent = 1;
    
    // these are used to pull out and store the data from the plist. the plist has a distionary(type string) of arrays(type String)
    var artistsAlbum = [String: [String]]()  // this stores the relation btw the artists and the albums
    var artists = [String]() // this is the key in the dictionary in the plist
    var albums = [String]()  // the albums keep changing when the artists changes. they are the array of values stored for each key
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) // component number starts from 0
        {
            return artists.count  // this tells the picker how many elements you have
        }
        else{
            return albums.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0)
        {
            return artists[row]  // this displays the data you want to diplay
        }
        else{
            return albums[row]
        }
    }
    
    // this handles what happens when you select something in it
    // dependent picker component
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == artistComponent  // or == 0
        {
            let selectedartist = artists[row] //gets the selected artist
            albums = artistsAlbum[selectedartist]! //gets the albums for the selected
            musicPicker.reloadComponent(albumComponent) // call this when there is new data
            musicPicker.selectRow(0, inComponent: albumComponent, animated: true) //set the album component back to 0
            
            choiceLabel.text = "You selected \(artists[row])."        }
    }

    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // URL for our plist
        if let pathUrl = Bundle.main.url(forResource: "artistalbums", withExtension: "plist") // it is the name of the plist. this is finding the plist /creates a property list decoder object
            {
                let plistdecoder = PropertyListDecoder()
               do
               {
                let data = try Data (contentsOf: pathUrl)
                //decodes the property list
                artistsAlbum = try plistdecoder.decode([String: [String]].self, from : data)
      
                // this returns the keys in the dictionary
                artists = Array(artistsAlbum.keys)   // assigning all the Dictionary keys in the artists array
                // This will return the whole array stored as the value associated with te keys
                albums = artistsAlbum[artists[0]]! as [String] // assign all the albums for the first artist in the albums array
                //

               }
               catch{
                 print(error)
                }
            }// if
    } // function

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

