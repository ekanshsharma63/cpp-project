




import UIKit

class DB_User {
    var Array_name = NSMutableArray()
    
    func createTable(){
        if let err = SD.createTable("User_DB",withColumnNamesAndTypes: ["name":.stringVal, "email": .stringVal, "password":.stringVal, "phoneNumber":.stringVal,"profileImg": .uiImageVal,"bannerImg": .uiImageVal,"fname":.stringVal,"lname":.stringVal]){
            print("Table Already exist \(err)")
        }else{
            print("No Error, The table was created successfully")
        }
    }
    
    func insertQuery(name: String, email: String, password: String, phoneNumber:String,profileImg:UIImage) ->Int{
        let result = SD.executeChange("INSERT INTO User_DB (name,email,password,phoneNumber,profileImg) VALUES (?,?,?,?,?)", withArgs: [name as AnyObject,email as AnyObject,password as AnyObject,phoneNumber as AnyObject,profileImg as AnyObject])
        
        print("added Successfully \(String(describing: result))")
        return result ?? 0
    }
    
    func createTableForMeal(){
        if let err = SD.createTable("Meal",withColumnNamesAndTypes: ["ItemIndex":.stringVal, "qauntity": .stringVal]){
            print("Table Already exist*** \(err)")
        }else{
            print("No Error, The table was created successfully")
        }
    }
    
    func insertMealQuery(mealDict:[[String:String]])->Int{
        var result:Int?
        for dict in mealDict{
            let mealItem = dict["ItemIndex"] ?? ""
            let quantity = dict["qauntity"] ?? ""
            result = SD.executeChange("INSERT INTO Meal (ItemIndex,qauntity) VALUES (?,?)", withArgs: [mealItem as AnyObject,quantity as AnyObject])
        }
        return result ?? 0
    }
    
    
    func checkLogin(email: String, password: String) -> [User]{
        var userArray:[User] = [User]()
        let str = "SELECT * FROM User_DB WHERE email='\(email)' AND password='\(password)'"
        let (data, err) = SD.executeQuery(str)
        if err != nil{
            print("There was an error during the query. The error is: \(err)")
        }else{
            let row = data.first
            let id = row?["ID"]?.asInt()
            let name = row?["name"]?.asString()
            let email = row?["email"]?.asString()
            let password = row?["password"]?.asString()
            let phoneNumber = row?["phoneNumber"]?.asString()
            let profileImg = row?["profileImg"]?.asUIImage() ?? UIImage()
            let bannerImg = row?["bannerImg"]?.asUIImage() ?? UIImage()
            
            userArray.append(User(id: id!, name: name!, email: email!, password: password!, phoneNumber: phoneNumber!,img: profileImg,bannerImg: bannerImg))
        }
        return userArray
    }
    
    func getParticularUser(userId: Int)-> [User]{
        var userArray:[User] = [User]()
        let str = "SELECT * FROM User_DB WHERE ID='\(userId)'"
        let (data, err) = SD.executeQuery(str)
        if err != nil{
            print("There was an error during the query. The error is: \(err)")
        }else{
            let result = data.first
            let id = result?["ID"]?.asInt()
            let name = result?["name"]?.asString()
            let email = result?["email"]?.asString()
            let password = result?["password"]?.asString()
            let phoneNumber = result?["phoneNumber"]?.asString()
            let profileImg = result?["profileImg"]?.asUIImage() ?? UIImage()
            let bannerImg = result?["bannerImg"]?.asUIImage() ?? UIImage()
            
            userArray.append(User(id: id!, name: name!, email: email!, password: password!, phoneNumber: phoneNumber!,img: profileImg,bannerImg: bannerImg))
        }
        return userArray
    }
   
    
    
    ///////Menu APP
    func insertProfile(fname: String, lname: String,profileImg:UIImage) ->Int{
        let result = SD.executeChange("INSERT INTO User_DB (fname,lname,profileImg) VALUES (?,?,?)", withArgs: [fname as AnyObject,lname as AnyObject,profileImg as AnyObject])
        
        print("added Successfully \(String(describing: result))")
        return result ?? 0
    }
    
    
    func updateUserProfile(fname: String, lname: String, profileImg:UIImage) ->Int{
        let result = SD.executeChange("UPDATE User_DB SET fname='\(fname)',lname='\(lname)',profileImg='\(profileImg)'")
        print("added Successfully \(String(describing: result))")
        return result ?? 0
    }
    
    func executeQuery() -> [Profile] {
        var userArray:[Profile] = [Profile]()
        let (data, err) = SD.executeQuery("SELECT * FROM User_DB")
        if err != nil
        {
            print("There was an error during the query. The error is: \(err)")
        }else{
            for row in data {
                let fname = row["fname"]?.asString() ?? ""
                let lname = row["lname"]?.asString() ?? ""
                let profileImg = row["profileImg"]?.asUIImage() ?? UIImage()
                userArray.append(Profile(fname: fname, lname: lname, profileImg: profileImg))
            }
        }
        return userArray
    }
    
    func executeMealQuery() -> [Meal] {
        var userArray:[Meal] = [Meal]()
        let (data, err) = SD.executeQuery("SELECT * FROM Meal")
        if err != nil
        {
            print("There was an error during the query. The error is: \(err)")
        }else{
            for row in data {
                let ItemIndex = row["ItemIndex"]?.asString() ?? ""
                let quantity = row["qauntity"]?.asString() ?? ""
                userArray.append(Meal(ItemIndex: ItemIndex, quantity: quantity))
            }
        }
        return userArray
    }
    
    func DropMealTableData() -> Int{
        let (data, err) = SD.executeQuery("DELETE FROM Meal")
        if err != nil
        {
            print("There was an error during the query. The error is: \(err)")
        }else{
            print("deleted column",data.count)
        }
       return 0
    }
}

class Profile {
    var fname = ""
    var lname = ""
    var profileImg = UIImage()
    
    init(fname:String,lname:String,profileImg:UIImage){
        self.fname = fname
        self.lname = lname
        self.profileImg = profileImg
    }
}

class Meal {
    var ItemIndex = "ItemIndex"
    var quantity = ""
    
    init(ItemIndex:String,quantity:String) {
        self.ItemIndex = ItemIndex
        self.quantity = quantity
    }
}

class User {
    var id = 0
    var name = ""
    var email = ""
    var password = ""
    var phoneNumber = ""
    var profileImg = UIImage()
    var bannerImg = UIImage()
    
    init(id:Int, name: String, email: String, password:String, phoneNumber: String, img: UIImage, bannerImg: UIImage) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.profileImg = img
        self.bannerImg = bannerImg
    }
    
    init(id:Int) {
        self.id = id
        
    }
}
