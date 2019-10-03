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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var imagePicker = UIImagePickerController()
    var newUser = NSManagedObject()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var userInformationArray = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        let fetchRequest = NSFetchRequest <NSFetchRequestResult> (entityName: "User")
        fetchRequest.returnsObjectsAsFaults = false
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let results = try context.fetch(fetchRequest)
            // check data existance
            if results.count>0 {
                var fetchedProfileImage = [UIImage]()
                for resultGot in results as! [NSManagedObject]{
                    userInformationArray.append(resultGot)
                    print("my array is : \(userInformationArray )")
                    for dict in userInformationArray{
                        fName.text = dict.value(forKey: "fname") as? String
                        lName.text = dict.value(forKey: "lname") as? String
                        //added this is convert the image
                        let profileImageData = dict.value(forKey: "img") as? Data ?? Data()
                        self.profileImage.image = UIImage(data: profileImageData)

                    }
                }
              }
        }catch{
            print("No Data to load")
        }
    }
    
    func configureNavBar() {
        navigationItem.title = "PROFILE"
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        
        let alert = UIAlertController(title:"Menu App", message: "Choose Any Picture", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title:"Camera", style: .default) { (action) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
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
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
            newUser.setValue(fName.text, forKey: "fname")
            newUser.setValue(lName.text, forKey: "lname")
            
//            let data = UIImage.jpegData(profileImage.image ?? UIImage())
            let data = profileImage.image?.jpegData(compressionQuality: 0.1)
            newUser.setValue(data, forKey: "img")
            do{
                try context.save()
                SwiftAlert().show(title: "Menu App", message: "Profile Saved Successfully!", viewController: self) {
                }
            }catch{
                print("failure")
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
