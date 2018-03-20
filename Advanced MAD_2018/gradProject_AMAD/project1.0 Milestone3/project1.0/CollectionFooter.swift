//
//  CollectionFooter.swift
//  project1.0
//
//  Created by Maitri Chattopadhyay on 3/2/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit
import  UserNotifications

class CollectionFooter: UICollectionReusableView {
    
    
    
    
    
    
    @IBOutlet weak var footerLabel: UILabel!
    @IBAction func notify(_ sender: UIButton) {
        
        
                var content = UNMutableNotificationContent()
        content.title = "mitri"
        content.subtitle = "hi"
        content.body = "mai"
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timeout", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
        
        
        
        
        
    }

