//
//  FadeEnabledButton.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 19/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class FadeEnabledButton: UIButton {
    
    override var isEnabled: Bool {
        
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                     self.alpha = 1.0
                }
            }
            else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
            
        }
    }
    
}
