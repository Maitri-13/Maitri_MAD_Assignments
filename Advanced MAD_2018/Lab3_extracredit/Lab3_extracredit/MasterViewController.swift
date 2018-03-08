//
//  MasterViewController.swift
//  Lab3_extracredit
//
//  Created by Maitri Chattopadhyay on 3/7/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
    // The data is a array[] of dictionary Strifg: String
    var seasons = [[String : String]]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Finding the Plist file
        if let pathURL = Bundle.main.url(forResource: "harrypotter2", withExtension: "plist")
        {
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                seasons = try plistdecoder.decode([[String:String]].self, from: data)
            }
            catch {
                print("File path is not correct")
            }
        }

        
       // This was already present
        if let split = splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    
    }
    

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let season = seasons[indexPath.row]
                let url = season["url"]!
                let name = season["name"]!
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = url as AnyObject?
                controller.title = name
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let  season = seasons[indexPath.row]  // got the distionary entry for this index
//                let url = season["url"]!  // geting the key for that entry
//                let name = season["name"]! // same.
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                //controller.detailItem = url as AnyObject?
//               // controller.detailItem = url as AnyObject?
//
//                controller.title = name
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let season = seasons[indexPath.row]
        cell.textLabel!.text = season["name"]  // geting value by the key
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

   


}

