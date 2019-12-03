//
//  PlacesVC.swift
//  menu
//
//  Created by MacBook on 14/10/19.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import GooglePlacesSearchController


protocol PassPlaceDetails {
    func placeDetails(place:PlaceDetails)
}


class PlacesVC: UIViewController {
    
    @IBOutlet weak var btn_search: UIButton!
    @IBOutlet weak var tf_search: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var arrayAddress = [GMSAutocompletePrediction]()
    var placesClient: GMSPlacesClient!
    var resultsViewController: GMSAutocompleteResultsViewController?
    var delegate : PassPlaceDetails? = nil
    
    lazy var filter: GMSAutocompleteFilter = {
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        return filter
    }()
    
    let serverKey = "AIzaSyBBmo2PYxM0xuXZVv7rakhJVxvkT4V52Yg"
    lazy var placesSearchController: GooglePlacesSearchController = {
        let controller = GooglePlacesSearchController(delegate: self,
                                                      apiKey: serverKey,
                                                      placeType: .address
        )
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        present(placesSearchController, animated: true, completion: nil)        
    }
    
    @IBAction func searchAddress(_ sender: UIBarButtonItem) {
        
    }
}

extension PlacesVC: GooglePlacesAutocompleteViewControllerDelegate {
    func viewController(didAutocompleteWith place: PlaceDetails) {
        print(place.description)
        self.delegate?.placeDetails(place: place)
        placesSearchController.isActive = false
        self.navigationController?.popViewController(animated: true)
    }
}


extension PlacesVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAddress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.attributedText = arrayAddress[indexPath.row].attributedFullText
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension PlacesVC:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchStr = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if searchStr == ""{
            self.arrayAddress = [GMSAutocompletePrediction]()
            
        }else{
            GMSPlacesClient.shared().autocompleteQuery(searchStr, bounds: nil, filter: filter, callback: { (result, error) in
                if error == nil && result != nil{
                    self.arrayAddress = result!
                }
            })
        }
        self.tableView.reloadData()
        return true
    }
}
