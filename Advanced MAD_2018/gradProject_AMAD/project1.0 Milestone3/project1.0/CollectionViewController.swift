//
//  CollectionViewController.swift
//  project1.0
//
//  Created by Maitri Chattopadhyay on 3/2/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit
import UserNotifications

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var signImages = [String]()
    
     //var plistData = Datafile() // Dont know why not working
    
    var allData = [String: [String]] ()
    var signs = [String]()
    var hororscope = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        for i in 1...12{
            signImages.append("sign" + String(i))
            
            var layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsetsMake(0,5,0,5)
            layout.minimumInteritemSpacing = 5
            
          // message to allow notifications
            UNUserNotificationCenter.current().requestAuthorization(options:[.alert, .sound, .badge], completionHandler:{
                didAllow, error in})
            
        }
            
            let pathURL:URL?
            //get path for data file
            let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let docDir = dirPath[0] //documents directory
         //   print("File paht is " , docDir)
           
                // URL for our plist
                pathURL = Bundle.main.url(forResource: "continents", withExtension: "plist")
            
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL!)
                //decodes the property list
//               plistData.dailyHororscope = try plistdecoder.decode([String: [String]].self, from: data)
//                plistData.hororscope = Array(plistData.dailyHororscope.keys)
                
                allData = try plistdecoder.decode([String: [String]].self, from: data)
                signs = Array(allData.keys)
                hororscope = Array(allData.values)  // the values is an array of array of strings
                
                
                
                
                
                
               // print("all data ", allData)
                
               // health = hororscope
                
                
                
                print("Horor  ", hororscope)
               // print("hor URL ", career[0])
            }
            catch {
                // handle error
                print(error)
            }

    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This method sets the size of the container according to the size of the images
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = UIImage(named: signImages[indexPath.row])
        
        // code to create resized image from https://www.snip2code.com/Snippet/89236/Resize-Image-in-iOS-Swift
        //create new size
        
        
        let newSize = CGSize(width: (image?.size.width)!*1.1, height: (image?.size.height)!*1.1)
        //creates a bitmap image with the new size
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        //draws the new image in a rectangle with the new size, scaling to fit
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        image?.draw(in: rect)
        //gets the image that was just drawn
        let image2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //end resizing
        //returns size of resized image
        return (image2?.size)!
    }
    
    
    // segue to the detailed viee. it si linked to the view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"
        {
            let indexPath = collectionView?.indexPath(for: sender as! CollectionViewCell)
            let detailVC = segue.destination as! DetailedViewController
        
            
            var index = (indexPath?.row)!
            print("index",index)
             var temp = ""
            
            switch index
            {
                case 0:
                   temp = "Aries"
                case 1:
                temp = "Taurus"
                case 2:
                temp = "Gemini"
                case 3:
                temp = "Cancer"
                case 4:
                    temp = "Leo"
                case 5:
                    temp = "Virgo"
                case 6:
                    temp = "Libra"
                case 7:
                    temp = "Scorpio"
                case 8:
                    temp = "Sagittarius"
                case 9:
                    temp = "Capricorn"
                case 10:
                    temp = "Acquarius"
                case 11:
                temp = "Pisces"
                
            default:
                print("Enter valid value")
                
            }
            
           // let index = allData.index(forKey: temp)
            var chosen = ""
            var horindex = 0
            for i in 0...11
            {
                if (signs[i] == temp)
                {
                    chosen = signs[i] + ": your daily hororscope"
                    horindex = i
                    break
                }
            }
           
            detailVC.signLabel = chosen
            var temp11 = hororscope[horindex]
            detailVC.dailyLabel = temp11[2]
            detailVC.careerhoror = temp11[0]
            detailVC.healthhoror = temp11[1]

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return signImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)as! CollectionViewCell
    
        let imageSet = UIImage(named: signImages[indexPath.row])
         cell.image.image = imageSet  // cell.nameOfVariableInClasss.image(what to set
      // just to set the boarder for each cell
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.layer.borderColor = UIColor.gray.cgColor
//        cell?.layer.borderWidth = 2
//
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.layer.borderColor = UIColor.lightGray.cgColor
//        cell?.layer.borderWidth = 0.5
//
//    }
//
//
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header: CollectionHeader?
        
        if kind == UICollectionElementKindSectionHeader
        {
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? CollectionHeader
            header?.headerLabel.text = "Chose a Sign"
            return header!
        }
        else
        {
            var footer: CollectionFooter?
            footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath) as? CollectionFooter
            footer?.footerLabel.text = "Copyright@Maitri"
            return footer!
        }
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
