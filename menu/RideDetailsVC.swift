//
//  RideDetailsVC.swift
//  menu
//
//  Created by MacBook on 04/10/19.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit
import  CoreLocation

class RideDetailsVC: UIViewController {

    @IBOutlet weak var tf_estimatedPrice: UITextField!
    @IBOutlet weak var tf_distance: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myLocation = CLLocation(latitude: 43.74423, longitude: -79.463984)
        
        let destinationLocation = CLLocation(latitude: 43.77335, longitude: -73.35999)
        let distance = myLocation.distance(from: destinationLocation) / 1000
        
        let integerValue = Int(distance)
        self.tf_distance.text = String(describing: integerValue)
        self.tf_estimatedPrice.text = "$" + String(integerValue * 1)
    }
    
    @IBAction func actionOnConfirmButn(_ sender: UIButton) {
        
    }
    
}
