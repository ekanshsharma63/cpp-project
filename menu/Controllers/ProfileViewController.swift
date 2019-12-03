//
//  ProfileViewController.swift
//  menu
//
//  Created by Ekansh Sharma on 2019-09-25.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit
import CoreData


var defaultImage = UserDefaults()
var defaultFname = UserDefaults()
var defaultLname = UserDefaults()

class ProfileViewController: UIViewController{
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    
    let userDB = DB_User()

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var imagePicker = UIImagePickerController()
    var newUser = NSManagedObject()
  
    var userInformationArray = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        let dd = userDB.executeQuery()
        let row = dd.last
        self.fName.text = row?.fname
            self.lName.text = row?.lname
            self.profileImage.image = row?.profileImg
            print("\(row?.fname)","\(row?.lname)","\(row?.profileImg)")
        }
    
    func configureNavBar() {
        navigationItem.title = "PROFILE"
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        
        let alert = UIAlertController(title:"Menu App", message: "Choose Any Picture", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title:"Camera", style: .default) { (action) in
            //self.imagePicker.sourceType = .camera
//            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let galleryAction = UIAlertAction(title:"Gallery", style: .default) { (action) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel) { (action) in
        }
        
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    
    func valid() -> Bool{
        var isValid: Bool = true
       if(fName.text?.count == 0){
            isValid = false
            SwiftAlert().show(title: "Menu App", message:"Enter Your First Name!", viewController: self, okAction: { () -> () in
            })
        }
        else if(lName.text?.count == 0){
            isValid = false
            SwiftAlert().show(title: "Menu App", message:"Enter Your Last Name!", viewController: self, okAction: { () -> () in
            })
        }
        return isValid
    }

    
    @IBAction func saveProfile(_ sender: Any) {
        if valid(){
            if let fname = fName.text,let lname = lName.text{
                
                let _ = userDB.insertProfile(fname: fname, lname: lname, profileImg: profileImage.image ?? UIImage(named:"food")!)
                SwiftAlert().show(title: "Menu App", message: "Profile Updated Successfully!", viewController: self, okAction: {
                    self.navigationController?.popViewController(animated: true)
                    
                })
            }
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        profileImage.image = info[.originalImage] as? UIImage
    }
}
