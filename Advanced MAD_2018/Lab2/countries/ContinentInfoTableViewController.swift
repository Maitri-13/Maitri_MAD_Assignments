//
//  CollectionViewController.swift
//  countries
//
//  Created by Maitri Chattopadhyay on 2/23/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ContinentInfoTableViewController: UITableViewController {

    @IBOutlet weak var continentName: UILabel!
    @IBOutlet weak var countryNumber: UILabel!
    
    var name = String()
    var number = String()
    
    override func viewWillAppear(_ animated: Bool) {
        continentName.text=name
        countryNumber.text=number
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }

}
