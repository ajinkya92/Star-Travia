//
//  BlackBgView.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 18/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        
        layer.backgroundColor = BLACKBG
        layer.cornerRadius = 10
        
    }
}

class BlackBgButton: UIButton {
    
    override func awakeFromNib() {
        
        layer.backgroundColor = BLACKBG
        layer.cornerRadius = 10
    }
    
}
