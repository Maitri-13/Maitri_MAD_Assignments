//
//  BorderedButtons.swift
//  homePage
//
//  Created by Maitri Chattopadhyay on 10/6/17.
//  Copyright © 2017 Maitri Chattopadhyay. All rights reserved.
//

import UIKit

// this class is to make the border for the buttons used for the repeting tasks
@IBDesignable
class BorderedButtons: UIButton {

    // these three variables are being exposed to the attribute inspector and from there we can alther the values
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.gray{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
