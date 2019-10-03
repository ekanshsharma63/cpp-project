//
//  OrderMyMealVC.swift
//  menu
//
//  Created by MacBook on 04/10/19.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit

class OrderMyMealVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var arr_order = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        arr_order = ["order 1          * 1", "order 2          * 2","order 3          * 3", "order 4          * 4","order 5          * 5", "order 6          * 6","order 7          * 7", "order 8          * 8"]
    }
}

extension OrderMyMealVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderMyMealCell
        cell.textLabel?.text = arr_order[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
