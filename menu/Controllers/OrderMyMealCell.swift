//
//  OrderMyMealCell.swift
//  menu
//
//  Created by MacBook on 04/10/19.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit

class OrderMyMealCell: UITableViewCell {

    
    @IBOutlet weak var lbl_mealType: UILabel!
    @IBOutlet weak var lbl_quantity: UILabel!
    @IBOutlet weak var butn_Increment: UIButton!
    @IBOutlet weak var butn_decrement: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
