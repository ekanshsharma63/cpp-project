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
    let userDB = DB_User()
    var str_quantity = String()
    var arr_mealQuantity : [[String:String]]? = [[String:String]]()
    
    var arr_appendQauntity0 = [[String:String]]()
    var arr_appendQauntity1 = [[String:String]]()
    var arr_appendQauntity2 = [[String:String]]()
    var arr_appendQauntity3 = [[String:String]]()
    var arr_appendQauntity4 = [[String:String]]()
    var arr_appendQauntity5 = [[String:String]]()
    var arr_appendQauntity6 = [[String:String]]()
    var arr_appendQauntity7 = [[String:String]]()
    var arr_appendQauntity8 = [[String:String]]()
    var arr_appendQauntity9 = [[String:String]]()
    var arr_passArrayToDB = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr_appendQauntity0.removeAll()
        arr_appendQauntity1.removeAll()
        arr_appendQauntity2.removeAll()
        arr_appendQauntity3.removeAll()
        arr_appendQauntity4.removeAll()
        arr_appendQauntity5.removeAll()
        arr_appendQauntity6.removeAll()
        arr_appendQauntity7.removeAll()
        arr_appendQauntity8.removeAll()
        arr_appendQauntity9.removeAll()
        
        arr_mealQuantity?.removeAll()
        arr_passArrayToDB.removeAll()
        arr_order = ["Meal1          * ", "Meal2          * ","Meal3          * ", "Meal4          * ","meal5          * ", "Meal6          * ","Meal7          * ", "Meal8          * ","Meal9          * ","Meal10          * "]
        getAllMealsType()
        configureNavBar()
    }
    
    func configureNavBar() {
        navigationItem.title = "Order My Meals"
    }
    
    func getAllMealsType(){
        let query = userDB.executeMealQuery()
        for dict in query{
            let index = dict.ItemIndex
            let quantity = dict.quantity
            let dict = ["ItemIndex":index,"qauntity":quantity]
            self.arr_mealQuantity?.append(dict)
            
            var arr_appendQaunt = [[String:String]]()
            arr_appendQaunt.append(dict)
            
            let int_quantity = Int(index)
            
            if int_quantity == 0{
                self.arr_appendQauntity0 = arr_appendQaunt
                
            }else if int_quantity == 1{
                self.arr_appendQauntity1 = arr_appendQaunt
                
            }else if int_quantity == 2{
                self.arr_appendQauntity2 = arr_appendQaunt
                
            }else if int_quantity == 3{
                self.arr_appendQauntity3 = arr_appendQaunt
                
            }else if int_quantity == 4{
                self.arr_appendQauntity4 = arr_appendQaunt
                
            }else if int_quantity == 5{
                self.arr_appendQauntity5 = arr_appendQaunt
                
            }else if int_quantity == 6{
                self.arr_appendQauntity6 = arr_appendQaunt
                
            }else if int_quantity == 7{
                self.arr_appendQauntity7 = arr_appendQaunt
                
            }else if int_quantity == 8{
                self.arr_appendQauntity8 = arr_appendQaunt
                
            }else if int_quantity == 9{
                self.arr_appendQauntity9 = arr_appendQaunt
            }
        }
        self.tableView.reloadData()
    }
    
    @objc func actionOnIncrement(sender:UIButton){
        let indexpath = IndexPath(row: sender.tag, section: 0)
        let cell = tableView.cellForRow(at: indexpath) as! OrderMyMealCell
        
        var quantity:Int = Int(cell.lbl_quantity.text  ?? "") ?? 0
        quantity += 1
        var arr_appendQaunt = [[String:String]]()
        
        let dict = ["ItemIndex":String(sender.tag), "qauntity":String(quantity)]
        arr_appendQaunt.append(dict)
        
        if sender.tag == 0{
            self.arr_appendQauntity0 = arr_appendQaunt
            
        }else if sender.tag == 1{
            self.arr_appendQauntity1 = arr_appendQaunt
            
        }else if sender.tag == 2{
            self.arr_appendQauntity2 = arr_appendQaunt
            
        }else if sender.tag == 3{
            self.arr_appendQauntity3 = arr_appendQaunt
            
        }else if sender.tag == 4{
            self.arr_appendQauntity4 = arr_appendQaunt
            
        }else if sender.tag == 5{
            self.arr_appendQauntity5 = arr_appendQaunt
            
        }else if sender.tag == 6{
            self.arr_appendQauntity6 = arr_appendQaunt
            
        }else if sender.tag == 7{
            self.arr_appendQauntity7 = arr_appendQaunt
            
        }else if sender.tag == 8{
            self.arr_appendQauntity8 = arr_appendQaunt
            
        }else if sender.tag == 9{
            self.arr_appendQauntity9 = arr_appendQaunt
            
        }
        cell.lbl_quantity.text = String(quantity)
    }
    
    @objc func actionOnDecrement(sender:UIButton){
        let indexpath = IndexPath(row: sender.tag, section: 0)
        let cell = tableView.cellForRow(at: indexpath) as! OrderMyMealCell
        
        var quantity:Int = Int(cell.lbl_quantity.text  ?? "") ?? 0
        if quantity > 0{
            
            quantity -= 1
            var arr_appendQaunt = [[String:String]]()
            
            let dict = ["ItemIndex":String(sender.tag), "qauntity":String(quantity)]
            arr_appendQaunt.append(dict)
            
            if sender.tag == 0{
                self.arr_appendQauntity0 = arr_appendQaunt
            }else if sender.tag == 1{
                self.arr_appendQauntity1 = arr_appendQaunt
                
            }else if sender.tag == 2{
                self.arr_appendQauntity2 = arr_appendQaunt
                
            }else if sender.tag == 3{
                self.arr_appendQauntity3 = arr_appendQaunt
                
            }else if sender.tag == 4{
                self.arr_appendQauntity4 = arr_appendQaunt
                
            }else if sender.tag == 5{
                self.arr_appendQauntity5 = arr_appendQaunt
                
            }else if sender.tag == 6{
                self.arr_appendQauntity6 = arr_appendQaunt
                
            }else if sender.tag == 7{
                self.arr_appendQauntity7 = arr_appendQaunt
                
            }else if sender.tag == 8{
                self.arr_appendQauntity8 = arr_appendQaunt
                
            }else if sender.tag == 9{
                self.arr_appendQauntity9 = arr_appendQaunt
            }
            cell.lbl_quantity.text = String(quantity)
        }
    }
    
    @IBAction func actionOnSaveButn(_ sender: UIButton) {
        
        userDB.DropMealTableData()
        
        let dict_0 = self.arr_appendQauntity0.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_0)
        
        
        let dict_1 = self.arr_appendQauntity1.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_1)
        
        
        let dict_2 = self.arr_appendQauntity2.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_2)
        
        let dict_3 = self.arr_appendQauntity3.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_3)
        
        
        let dict_4 = self.arr_appendQauntity4.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_4)
        
        
        let dict_5 = self.arr_appendQauntity5.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_5)
        
        
        let dict_6 = self.arr_appendQauntity6.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_6)
        
        
        let dict_7 = self.arr_appendQauntity7.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_7)
        
        
        let dict_8 = self.arr_appendQauntity8.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_8)
        
        
        let dict_9 = self.arr_appendQauntity9.last ?? [String : String]()
        self.arr_passArrayToDB.append(dict_9)
        
        _ = userDB.insertMealQuery(mealDict: arr_passArrayToDB)
        
        SwiftAlert().show(title: "Menu App", message: "Meal Order saved!", viewController: self, okAction: {
            self.navigationController?.popViewController(animated: true)
        })
    }
}

extension OrderMyMealVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderMyMealCell
        cell.lbl_mealType.text = arr_order[indexPath.row]
        
        if arr_mealQuantity?.count != 0{
            let dict = arr_mealQuantity?[indexPath.row]
            
            let ItemIndex = dict?["ItemIndex"] ?? ""
            let int_index = Int(ItemIndex)
            
            if int_index == 0{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }else if int_index == 1{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }else if int_index == 2{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }else if int_index == 3{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }else if int_index == 4{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }else if int_index == 5{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }else if int_index == 6{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }else if int_index == 7{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }else if int_index == 8{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }else if int_index == 9{
                cell.lbl_quantity.text = dict?["qauntity"] ?? ""
            }
        }
        cell.butn_Increment.addTarget(self, action: #selector(actionOnIncrement), for: .touchUpInside)
        cell.butn_decrement.addTarget(self, action: #selector(actionOnDecrement), for: .touchUpInside)
        cell.butn_decrement.tag = indexPath.row
        cell.butn_Increment.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
