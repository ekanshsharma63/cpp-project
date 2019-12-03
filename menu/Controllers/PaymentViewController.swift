//
//  PaymentViewController.swift
//  menu
//
//  Created by Ekansh Sharma on 2019-09-25.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var tf_firstName: UITextField!
    @IBOutlet weak var tf_lastname: UITextField!
    @IBOutlet var tf_cardNumber: UITextField!
    @IBOutlet var tf_cvc: UITextField!
    @IBOutlet var tf_Expiration: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }
    
    func configureNavBar() {
        navigationItem.title = "PAYMENT"
    }
    
    //MARK: Fields Validations
    func validation() -> Bool{
        var isValid: Bool = true
        if (tf_firstName.text?.count == 0){
            isValid = false
            SwiftAlert().show(title: GlobalConstants.appDetails.appName, message: GlobalConstants.TextFieldsMessages.Firstname, viewController: self, okAction: { () -> () in
            })
        }
        else if (tf_lastname.text?.count == 0){
            isValid = false
            SwiftAlert().show(title: GlobalConstants.appDetails.appName, message: GlobalConstants.TextFieldsMessages.lastname, viewController: self, okAction: { () -> () in
            })
        }
        else if (tf_cardNumber.text?.count == 0){
            isValid = false
            SwiftAlert().show(title: GlobalConstants.appDetails.appName, message: GlobalConstants.TextFieldsMessages.cardNumber, viewController: self, okAction: { () -> () in
            })
        }
        else if (tf_cvc.text?.count == 0){
            isValid = false
            SwiftAlert().show(title: GlobalConstants.appDetails.appName, message: GlobalConstants.TextFieldsMessages.cvc, viewController: self, okAction: { () -> () in
            })
        }
        else if (tf_Expiration.text?.count == 0){
            isValid = false
            SwiftAlert().show(title: GlobalConstants.appDetails.appName, message: GlobalConstants.TextFieldsMessages.cardExpire, viewController: self, okAction: { () -> () in
            })
        }
        return isValid
    }
    
    
    @IBAction func actionOnSubmitButn(_ sender: UIButton) {
        if validation(){
            self.navigationController?.popViewController(animated: true)
        }
    }
}
