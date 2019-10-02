//
//  ProfileViewController.swift
//  menu
//
//  Created by Ekansh Sharma on 2019-09-25.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit

var defaultImage = UserDefaults()
var defaultFname = UserDefaults()
var defaultLname = UserDefaults()

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }
   
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {// Check if the device has a camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {

                // Device has a camera, now create the image picker controller
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false

                self.present(imagePicker, animated: true, completion: nil)

            }
            else {
                NSLog("No Camera")
            }
        }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        // To dismiss the image picker
        self.dismiss(animated: true, completion: nil)

        imageView.image = info[.originalImage] as? UIImage
        
    

        // Do whatever you wish with the image
    }
    
 
    
    
    
        func configureNavBar() {
        navigationItem.title = "PROFILE"
    }
    
    @IBOutlet weak var fName: UITextField!
    
    
    @IBOutlet weak var lName: UITextField!
    
    
    @IBAction func saveProfile(_ sender: Any) {
  
     }
    
    
    
    // Storing default values
    func storeData() {
        
        defaultImage.set(imageView.image, forKey: "Profile Image")
        defaultImage.synchronize()
    }
    
    
    // getting default values
    func getData() {
        let pImage = defaultImage.value(forKey: "Profile Image")
        if pImage != nil {
            imageView.image = pImage as? UIImage
        } else {}
        
    }
}
