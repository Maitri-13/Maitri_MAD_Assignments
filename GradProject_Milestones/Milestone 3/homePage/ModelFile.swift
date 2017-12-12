//
//  ModelFile.swift
//  homePage
//
//  Created by Maitri Chattopadhyay on 10/4/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import Foundation
class ModelFile
{
    var title : String?
    var description: String?
    var startDate: String?
    var repeatWeekly: String?
    var repeatForever: String?
    
    init(){}
    
    init( title: String,  description: String, startDate: String, repeatWeekly: String, repeatForever: String)
    
    {
            self.title = title
            self.description = description
        self.startDate = startDate
        self.repeatWeekly = repeatWeekly
        self.repeatForever = repeatForever
        
    
    }
}
