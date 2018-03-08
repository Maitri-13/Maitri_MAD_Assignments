//
//  CollectionViewController.swift
//  countries
//
//  Created by Maitri Chattopadhyay on 2/23/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//


import UIKit

class ViewController: UITableViewController {
    var continentList = Continents()

    
      var searchController : UISearchController!
    let kfilename = "data2.plist"  // the new file
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pathURL:URL?
    
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0]
        print("File paht is " , docDir)
        
        //this is the path for the new plist to persist data
        let dataFileURL = docDir.appendingPathComponent(kfilename)
       
        
       
        if FileManager.default.fileExists(atPath: dataFileURL.path){
            pathURL = dataFileURL
        }
        else {
        
        pathURL = Bundle.main.url(forResource: "continents", withExtension: "plist")
        }
        
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL!)
               
                continentList.continentData = try plistdecoder.decode([String: [String]].self, from: data)
                continentList.continents = Array(continentList.continentData.keys)
            } catch {
                // handle error
                print(error)
            }
        

        let resultsController = SearchResultsController()
        resultsController.allwords = continentList.continents
        searchController = UISearchController(searchResultsController: resultsController) //
        
        
        searchController.searchBar.placeholder = "Enter a search term"
        
        tableView.tableHeaderView=searchController.searchBar // table header
        searchController.searchResultsUpdater = resultsController
        
        
        //enables large titles
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.applicationWillResignActive(_:)), name: NSNotification.Name.UIApplicationWillResignActive, object: app)
    }

    override func viewWillAppear(_ animated: Bool) {
        //print("view will appear")
    }
    
    @IBAction func preparetounwind(_ segue: UIStoryboardSegue){
        //print("unwinding")
    }
    
    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continentList.continents.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = continentList.continents[indexPath.row]
        return cell
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "countrysegue" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            //sets the data for the destination controller
            detailVC.title = continentList.continents[indexPath.row]
            detailVC.continentListDetail=continentList
            detailVC.selectedContinent = indexPath.row
       // }
            // NOT using this in this application.
         if segue.identifier == "continentsegue"{
            let infoVC = segue.destination as! ContinentInfoTableViewController
            let editingCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: editingCell)
            infoVC.name = continentList.continents[indexPath!.row]
            let countries = continentList.continentData[infoVC.name]! as [String]
            infoVC.number = String(countries.count)
        }
    }
    
   
    @objc func applicationWillResignActive(_ notification: NSNotification)
    {
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0]
        print(docDir)
        
   
        let dataFileURL = docDir.appendingPathComponent(kfilename)
        print(dataFileURL)
    
        let plistencoder = PropertyListEncoder()
        plistencoder.outputFormat = .xml
        do {
            let data = try plistencoder.encode(continentList.continentData)
            try data.write(to: dataFileURL)
        } catch {
         
            print("wrong path for the file")
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

