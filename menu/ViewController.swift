//
//  ViewController.swift
//  menu
//
//  Created by SimranjeetSingh Gill on 2019-09-18.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate  {

        
    
    @IBOutlet weak var map: MKMapView!
   
    let manager = CLLocationManager()
       
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
             
             {
                let location = locations[0]
                       
                 let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                       
                       let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                       let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
                       map.setRegion(region, animated: true)
                       
                       self.map.showsUserLocation = true
          }
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    


}

