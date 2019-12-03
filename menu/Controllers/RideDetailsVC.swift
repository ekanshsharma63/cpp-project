//
//  RideDetailsVC.swift
//  menu
//
//  Created by MacBook on 04/10/19.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit
import CoreLocation
import GooglePlaces
import GooglePlacesSearchController

class RideDetailsVC: UIViewController {

    @IBOutlet weak var lbl_detinationName: UILabel!
    @IBOutlet weak var tf_estimatedPrice: UITextField!
    @IBOutlet weak var tf_distance: UITextField!
    
    var  destionationLocation = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }
    
    func configureNavBar() {
        navigationItem.title = "Delivery Details"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tf_estimatedPrice.text = "$" + String(appDelegate?.int_distance ?? 0 * 1)
        self.lbl_detinationName.text = appDelegate?.address
        self.tf_distance.text = String(appDelegate?.int_distance ?? 0)
    }
    
    @IBAction func actionOnConfirmButn(_ sender: UIButton) {
        
    }
    
    @IBAction func actionOnDestination(_ sender: UIButton) {
        let PlacesVar = self.storyboard?.instantiateViewController(withIdentifier: "PlacesVC") as! PlacesVC
        PlacesVar.delegate = self
        self.navigationController?.pushViewController(PlacesVar, animated: true)
        
    }
    @IBAction func actionOnMap(_ sender: UIButton) {
//        let mapScreen = self.storyboard?.instantiateViewController(withIdentifier: "MapScreen") as! MapScreen
//        mapScreen.delegate = self
//        self.navigationController?.pushViewController(mapScreen, animated: true)
    }
}

extension RideDetailsVC: PassPlaceDetails{
    func placeDetails(place:PlaceDetails){
        let myLocation = CLLocation(latitude: (appDelegate?.currentLocationCoordinates.latitude)!, longitude: (appDelegate?.currentLocationCoordinates.longitude)!)
        
        let location = place.coordinate
        let destinationLocation = CLLocation(latitude: location?.latitude ?? 0.0, longitude: location?.longitude ?? 0.0)
        
        let distance = myLocation.distance(from: destinationLocation) / 1000

        appDelegate?.int_distance = Int(distance)
        appDelegate?.address = place.name ?? ""
    }
}


