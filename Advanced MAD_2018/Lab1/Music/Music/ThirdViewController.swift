//
//  ThirdViewController.swift
//  Music
//
//  Created by Maitri Chattopadhyay on 1/30/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBAction func goToMusic(_ sender: UIButton) {
        //check to see if there's an app installed to handle this URL scheme
        if(UIApplication.shared.canOpenURL(URL(string: "spotify://")!))
        {
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "spotify://")!, options: [:], completionHandler: nil)
        }
        else
        {
            if(UIApplication.shared.canOpenURL(URL(string: "music://")!))
            {
                UIApplication.shared.open(URL(string: "music://")!, options: [:], completionHandler: nil)
            }
            else
            {
                UIApplication.shared.open(URL(string: "http://www.apple.com/music/")!, options: [:], completionHandler: nil)
            }
        }
    }
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
