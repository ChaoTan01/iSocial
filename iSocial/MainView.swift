//
//  MainView.swift
//  iSocial
//
//  Created by Chao Tan on 9/4/16.
//  Copyright © 2016 Chao Tan. All rights reserved.
//

import UIKit

class MainView: UIView {

// Shadowing
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.9).cgColor
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        
        
    }
    
    

}
