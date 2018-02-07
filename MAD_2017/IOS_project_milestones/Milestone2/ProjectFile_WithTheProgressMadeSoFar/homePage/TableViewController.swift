//
//  TableViewController.swift
//  homePage
//
//  Created by Maitri Chattopadhyay on 9/28/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

var arr : [String] = ["Go to the gym", "Buy shoes"]
var arr1 : [String] = ["must go to the gym", "winter shoe sale"]



class TableViewController: UITableViewController {

    var user = ModelFile()
    
    
  @IBAction
    func unwindSegueToSecondPage(_ segToSec: UIStoryboardSegue)
    
    {
            // should i call the table view method in this function?
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return user.title!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = user.title?[indexPath.row]
        cell.detailTextLabel?.text = user.description?[indexPath.row]
        return cell
    }

    
}
