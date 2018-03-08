//
//  CollectionViewController.swift
//  countries
//
//  Created by Maitri Chattopadhyay on 2/23/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//


import UIKit

class DetailViewController: UITableViewController {
    var countries = [String]()
    var selectedContinent = 0
    var continentListDetail = Continents()

    override func viewWillAppear(_ animated: Bool) {
        continentListDetail.continents = Array(continentListDetail.continentData.keys)
        let chosenContinent = continentListDetail.continents[selectedContinent]
        countries = continentListDetail.continentData[chosenContinent]! as [String]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }


    // Draws the content of each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
   
    // Method to handle the deletion of an item for the TV
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            countries.remove(at: indexPath.row)
            let chosenContinent = continentListDetail.continents[selectedContinent]
            continentListDetail.continentData[chosenContinent]?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return false
    }
        
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            let source = segue.source as! AddCountryViewController
            if ((source.addedCountry.isEmpty) == false){
                countries.append(source.addedCountry)
                tableView.reloadData()
                let chosenContinent = continentListDetail.continents[selectedContinent]
                continentListDetail.continentData[chosenContinent]?.append(source.addedCountry)
            }
        }
    }

    

}
