//
//  ReleaseViewController.swift
//  menu
//
//  Created by Ekansh Sharma on 2019-09-26.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit

class ReleaseViewController: UIViewController {
    override func viewDidLoad() {
           super.viewDidLoad()
           configureNavBar()
       }
       
       func configureNavBar() {
           navigationItem.title = "UPCOMING RELEASES"
       }
}
