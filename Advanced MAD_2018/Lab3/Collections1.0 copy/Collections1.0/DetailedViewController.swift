//
//  DetailedViewController.swift
//  Collections1.0
//
//  Created by Maitri Chattopadhyay on 2/23/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    // For sharing functionality
    @IBAction func share(_ sender: Any) {
        var imageArray = [UIImage]()
        imageArray.append(imageView.image!)
        let shareScreen = UIActivityViewController(activityItems: imageArray, applicationActivities: nil)
        shareScreen.modalPresentationStyle = .popover
        shareScreen.popoverPresentationController?.barButtonItem = sender as! UIBarButtonItem
        present(shareScreen, animated: true, completion: nil)
    
    }
    
    @IBOutlet weak var tet: UILabel!
    var tetLabel : String?
    @IBOutlet weak var imageView: UIImageView!
    var imageName : String?
    override func viewDidLoad() {
    
        super.viewDidLoad()
    }

    @IBOutlet weak var share: UIBarButtonItem!
    override func viewWillAppear(_ animated: Bool) {
            if let name = imageName {
                imageView.image = UIImage(named: name)
                tet.text = tetLabel
            }
        }
        
    
        
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */

}
