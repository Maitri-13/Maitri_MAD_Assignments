//
//  CollectionViewController.swift
//  countries
//
//  Created by Maitri Chattopadhyay on 2/23/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//



import UIKit

class SearchResultsController: UITableViewController, UISearchResultsUpdating {
    
    var allwords = [String]()  // gets all the contents of the table view
    var filteredWords = [String]()  // filters out according to the filter

    override func viewDidLoad()
    {
        super.viewDidLoad()
      
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")

    }

    
    func updateSearchResults(for searchController: UISearchController)
    {
        let searchString = searchController.searchBar.text
        filteredWords.removeAll(keepingCapacity: true)
        if searchString?.isEmpty == false
        {
            let searchfilter: (String) -> Bool = { name in
                let range = name.range(of: searchString!, options: .caseInsensitive)
                return range != nil //returns true if the value matches and false if there’s no match
            }
            let matches = allwords.filter(searchfilter)
            filteredWords.append(contentsOf: matches)
        }
        tableView.reloadData() //Reloads the data in the table view. Draws out each cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = filteredWords[indexPath.row]
        return cell
    }

}
