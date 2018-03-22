//
//  ViewController.swift
//  lab5
//
//  Created by Maitri Chattopadhyay on 3/19/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {
    var realm : Realm!
    var groceryList: Results<Grocery>
    {
        get
        {
            return realm.objects(Grocery.self)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            realm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Adding new items into the DB
    @IBAction func addGroceryItem(_ sender: UIBarButtonItem) {
        
        let addalert = UIAlertController(title: "New Grocery", message: "Add a new item to your list", preferredStyle: .alert)
        addalert.addTextField(configurationHandler: {(UITextField) in
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Add", style: .default, handler: {(UIAlertAction)in
            let newitem = addalert.textFields![0]
            let newGroceryItem = Grocery()
            newGroceryItem.name = newitem.text!
            newGroceryItem.bought = false
            do {
                try self.realm.write({
                    self.realm.add(newGroceryItem)
                    self.tableView.insertRows(at: [IndexPath.init(row: self.groceryList.count-1, section:0)], with: .automatic)
                })
            } catch let error{
                print(error.localizedDescription)
            }
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groceryList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = groceryList[indexPath.row]
        cell.textLabel!.text = item.name
        cell.accessoryType = item.bought ? .checkmark : .none // check or no mark
        return cell
    }
    
    // delete row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let item = groceryList[indexPath.row]
        
        try! self.realm.write
        {
            item.bought = !item.bought
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // doing this to enable deletion of row
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // delete row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let item = groceryList[indexPath.row]
            try! self.realm.write
            {
                self.realm.delete(item) // delee for DB
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}

