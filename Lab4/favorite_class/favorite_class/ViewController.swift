//
//  ViewController.swift
//  favorite_class
//
//  Created by Maitri Chattopadhyay on 10/3/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var book: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var tvShow: UILabel!
    
    // create instance of the modelFile
    var user = ModelFile()
    
    // this will create a new file on itself. We dont need ot manually create the file
    let filename = "favs.plist"
    
    @IBAction
    func unwindSegue(_ segue:UIStoryboardSegue)
    {
        // assigning the values from the model class to the story board variables
        book.text = user.favBook
        author.text = user.favAuthor
        tvShow.text = user.favTvShow
    }

    // this function is used to get the path of the file that we wrote in to
    func docFilePath(_ filename: String) -> String?
    {
       
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString
        return dir.appendingPathComponent(filename)
    }

    
    
    override func viewDidLoad() {
        let filePath = docFilePath(filename)
        
        
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            
            let dataDictionary = NSDictionary(contentsOfFile: path!) as! [String:String]
          
            // checks if the dictionary contains the key
            if dataDictionary.keys.contains("book") {
                // fectches the data that is stored in that key.
                user.favBook = dataDictionary["book"]
                // writes that data into the lable on the story board
                book.text=user.favBook
            }
           
            if dataDictionary.keys.contains("author") {
                user.favAuthor = dataDictionary["author"]
                author.text=user.favAuthor
            }
            if dataDictionary.keys.contains("tvshow") {
                user.favTvShow = dataDictionary["tvshow"]
                tvShow.text=user.favTvShow
            }
        }
        
     
        let app = UIApplication.shared
    
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
        super.viewDidLoad()
    }
    
    // this function writes the values into the dictronary with the keys you provided.
        func applicationWillResignActive(_ notification: Notification)
        {
            let filePath = docFilePath(filename)
            let data = NSMutableDictionary()
           
            if user.favBook != nil
            {
                data.setValue(user.favBook, forKey: "book")
                
            }
            if user.favAuthor != nil
            {
                data.setValue(user.favAuthor, forKey: "author")
            }
            if user.favTvShow != nil
            {
                data.setValue(user.favTvShow, forKey: "tvshow")
            }
            data.write(toFile: filePath!, atomically: true)
        }
    

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    

}

