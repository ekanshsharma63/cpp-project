//
//  UINavigationView+Extensions.swift
//  Renturcar
//
//  Created by OSX on 13/07/17.
//  Copyright © 2017 Macrew. All rights reserved.
//

import UIKit
import UIKit

extension CAGradientLayer {
	
	func backgroundGradientColor() -> CAGradientLayer {
		let topColor = UIColor(red: (0/255.0), green: (153/255.0), blue:(51/255.0), alpha: 1)
		let bottomColor = UIColor(red: (0/255.0), green: (153/255.0), blue:(255/255.0), alpha: 1)
		
		let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
		let gradientLocations: [Float] = [0.0, 1.0]
		
		let gradientLayer: CAGradientLayer = CAGradientLayer()
		gradientLayer.colors = gradientColors
		gradientLayer.locations = gradientLocations as [NSNumber]
		
		return gradientLayer
		
	}
}

extension UINavigationController {
    func clearNavigation() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
        
    }
    
    func setTextColor(_ color: UIColor) {
        self.navigationBar.tintColor = color
		self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : color]
        
    }
    
    func clearBackButtonText() {
        self.navigationBar.topItem?.title = ""
        
    }
    func disableUserInteraction() {
        self.navigationBar.isUserInteractionEnabled = false
    }
    func enableUserInteraction() {
        self.navigationBar.isUserInteractionEnabled = true
    }
}

