//
//  ViewController.swift
//  maitri_exam
//
//  Created by Maitri Chattopadhyay on 3/14/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var data = dataModel()
    
    let filename = "fav.plist"
    
    var searchController : UISearchController!
    // this function writes the values into the dictronary with the keys you provided.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.resName = ["Luciles", "Rincon Argentina", "Backcountry Pizza"]
        data.urlName = ["https://www.luciles.com/", "https://www.rinconargentinoboulder.com/", "https://www.backcountrypizzaandtaphouse.com/"]
       
        
       // For the edit button to move cells up and down item bar button
       // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // For large title
       // navigationController?.navigationBar.prefersLargeTitles = true

//        let pathURL:URL?
//        //get path for data file
//        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let docDir = dirPath[0] //documents directory
//        print("I am here",docDir)
//
//        // URL for our plist
//        let dataFileURL = docDir.appendingPathComponent(filename)
//        print(dataFileURL)
//
//        //if the data file exists, use it
////        if FileManager.default.fileExists(atPath: dataFileURL.path)
////        {
//            pathURL = dataFileURL
//        //}
//        //creates a property list decoder object
//        let plistdecoder = PropertyListDecoder()
//        do {
//            let data = try Data(contentsOf: pathURL!)
//            //decodes the property list
//            array = try plistdecoder.decode([String].self, from: data)
//            //arrayUrl = try plistdecoder.decode([String].self, from: data)
//        } catch {
//            // handle error
//            print(error)
//        }

        
        
        //search results
        let resultsController = SearchResultsController() //create an instance of our SearchResultsController class
        resultsController.allwords = data.resName //set the allwords property to our words array
        searchController = UISearchController(searchResultsController: resultsController) //initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        //searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
    }
    
    
   
    
    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.resName.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = data.resName[indexPath.row]
        return cell
    }
    //-------------dlete---------------
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

            
            data.resName.remove(at: indexPath.row)
          data.urlName.remove(at: indexPath.row)
            // Delete the row from the table
            tableView.deleteRows(at: [indexPath], with: .fade)

    }
    //----------------------------------
    
    //Handles segues to other view controllers
    // Data from the other page is transfered to this page here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showWebsegue" {
//            let detailVC = segue.destination as! DetailViewController
//            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
//            detailVC.titlename = arrayUrl[indexPath.row]
//
//
//
//            //sets the data for the destination controller
//                            //            detailVC.title = continentList.continents[indexPath.row]
//                            //            detailVC.continentListDetail=continentList
//                            //            detailVC.selectedContinent = indexPath.row
//        }
        if segue.identifier == "showWebsegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let url = data.urlName[indexPath.row]
                let name = data.resName[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = url as AnyObject?
                controller.title = name
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        else if segue.identifier == "addsegue"
        {
            
            
            
            
        }
        //for detail disclosure
//        else if segue.identifier == "continentsegue"{
//            let infoVC = segue.destination as! ContinentInfoTableViewController
//            let editingCell = sender as! UITableViewCell
//            let indexPath = tableView.indexPath(for: editingCell)
//            infoVC.name = continentList.continents[indexPath!.row]
//            let countries = continentList.continentData[infoVC.name]! as [String]
//            infoVC.number = String(countries.count)
//        }
    }
    

    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier=="donesegue"
                    {
                        let source = segue.source as! SecondViewController
                        //only add a country if there is text in the textfield
                        
                        if ((source.newthing.isEmpty) == false && (source.newUrl.isEmpty) == false )
                        {
                            //add country to the array
                            data.resName.append(source.newthing)
                            data.urlName.append(source.newUrl)
                            tableView.reloadData()
        
                        }
                        
                    }
    }

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

