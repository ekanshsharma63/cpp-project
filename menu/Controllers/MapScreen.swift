//
//  MapScreen.swift
//  menu
//
//  Created by MacBook on 11/10/19.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacesSearchController


protocol PassDestinationCoordinates {
    func destinationCoordinates(location:CLLocationCoordinate2D,destinationAddress: String)
}


class MapScreen: UIViewController {
    
    var geocoder : GMSGeocoder? = nil
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView?
    var zoomLevel: Float = 15.0
    
    var destinationLocation = CLLocationCoordinate2D()
    var str_destinationAddress = String()
    var delegate :PassDestinationCoordinates? = nil
    
    @IBOutlet weak var menuButn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation() 
        locationManager = CLLocationManager()
        geocoder = GMSGeocoder()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        mapView?.delegate = self
    }
    
    func setUpNavigation() {
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.handleRightMenu))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func handleRightMenu(sender:UIButton){
        let listingVC = self.storyboard?.instantiateViewController(withIdentifier: "ListingVC") as! ListingVC
        self.navigationController?.pushViewController(listingVC, animated: true)
    }
    
    @IBAction func actionOnLocateMeButn(_ sender: UIButton) {
        locationManager = CLLocationManager()
        geocoder = GMSGeocoder()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        mapView?.delegate = self
    }
    
    @IBAction func actionOnAddManualAddressButn(_ sender: UIButton) {
        let PlacesVar = self.storyboard?.instantiateViewController(withIdentifier: "PlacesVC") as! PlacesVC
        PlacesVar.delegate = self
        self.navigationController?.pushViewController(PlacesVar, animated: true)
    }
}

extension MapScreen: CLLocationManagerDelegate, GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("didTap Marker:***", marker.position.latitude,marker.position.longitude)
        mapView.selectedMarker = marker
        let point = mapView.projection.point(for: marker.position)
        let camera = mapView.projection.coordinate(for: point)
        let position = GMSCameraUpdate.setTarget(camera)
        mapView.animate(with: position)
        delegate?.destinationCoordinates(location: self.destinationLocation,destinationAddress:self.str_destinationAddress)
        self.navigationController?.popViewController(animated: true)
        return true
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        mapView.clear()
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        geocoder?.reverseGeocodeCoordinate(position.target) { (response, error) in
            guard error == nil else {
                return
            }
            
            if let result = response?.firstResult() {
                let marker = GMSMarker()
                self.destinationLocation = position.target
                marker.position = position.target
                marker.title = result.lines?[0]
                self.str_destinationAddress = marker.title ?? ""
                marker.map = mapView
            }
        }
    }
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let userLocation = locations.last
        let center = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.width, height: view.frame.height - 200), camera: camera)
        
        mapView?.isMyLocationEnabled = true
        mapView?.settings.myLocationButton = true
        mapView?.animate(to: camera)
        mapView?.delegate = self
        
        let marker = GMSMarker(position: center)
        marker.map = mapView
        marker.title = "Current Location"
        view.addSubview((mapView)!)
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView?.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        default:
            break
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Error: \(error)")
    }
}

extension MapScreen: PassPlaceDetails{
    func placeDetails(place: PlaceDetails) {
        let center = CLLocationCoordinate2D(latitude: place.coordinate!.latitude, longitude: place.coordinate!.longitude)
        
        let camera = GMSCameraPosition.camera(withLatitude: place.coordinate!.latitude,
                                              longitude: place.coordinate!.longitude,
                                              zoom: zoomLevel)
        
        mapView = GMSMapView.map(withFrame: CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.width, height: view.frame.height - 200), camera: camera)
        
        mapView?.isMyLocationEnabled = true
        mapView?.settings.myLocationButton = true
        mapView?.animate(to: camera)
        mapView?.delegate = self
        
        let marker = GMSMarker(position: center)
        marker.map = mapView
        marker.title = place.name
        view.addSubview((mapView)!)
    }
}


