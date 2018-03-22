//
//  Grocery.swift
//  groceryList
//
//  Created by Maitri Chattopadhyay on 3/19/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import Foundation
import RealmSwift

class Grocery: Object {
    @objc dynamic var name = ""
    @objc dynamic var bought = false  // for the check mark
}

