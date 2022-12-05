//
//  UserDAL.swift
//  materiomoni
//
//  Created by Utsav busa on 20/11/22.
//

import UIKit

class UserDAL: NSObject {

    class func getUser()->[Users]
    {
        var users:[Users] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open(){
            
//            "select * from Profile,Caste where Profile.ProfileID = Caste.CasteID "
            
            let quary = "select * from Profile"
            do{
                let resultSet = try dbconn.executeQuery(quary, values: [])
                
                while (resultSet.next()){
                    
                    let SigleUser:Users = Users()
                    
                    SigleUser.ProfileID = resultSet.int(forColumn: "ProfileID")
                    SigleUser.Name = resultSet.string(forColumn: "Name") ?? ""
                    SigleUser.Gender = resultSet.string(forColumn: "Gender") ?? ""
                    SigleUser.DOB = resultSet.string(forColumn: "DOB") ?? ""
                    SigleUser.Age = resultSet.int(forColumn: "Age")
                    SigleUser.CasteId = resultSet.int(forColumn: "CasteId")
                    SigleUser.Education = resultSet.string(forColumn: "Education") ?? ""
                    SigleUser.Height = resultSet.string(forColumn: "Height") ?? ""
                    SigleUser.Address = resultSet.string(forColumn: "Address")!
                    SigleUser.City = resultSet.string(forColumn: "City")!
                    SigleUser.State = resultSet.string(forColumn: "State")!
                    SigleUser.Phone = resultSet.string(forColumn: "Phone")!
                    SigleUser.Mobile = resultSet.string(forColumn: "Mobile")!
                    SigleUser.Email = resultSet.string(forColumn: "Email")!
                    SigleUser.Remarks = resultSet.string(forColumn: "Remarks")!
                    SigleUser.IsFavourite = resultSet.int(forColumn: "IsFavourite")
//                    SigleUser.CasteName = resultSet.string(forColumn: "CasteName")!
                    
                    
                    
                    users.append(SigleUser)
                    
                   
                }
            }
            catch{
                print(error)
            }
            
        }
        else{
            print("not connect datatabse")
        }
        dbconn.close()
        
        return users
    }
    class func getFavouriteUser()->[Users]
    {
        var Favouriteusers:[Users] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open(){
            
            let quary = "select * from Profile where IsFavourite = 1"
            do{
                let resultSet = try dbconn.executeQuery(quary, values: [])
                
                while (resultSet.next()){
                    
                    let SigleUser:Users = Users()
                    
                    SigleUser.ProfileID = resultSet.int(forColumn: "ProfileID")
                    SigleUser.Name = resultSet.string(forColumn: "Name") ?? ""
                    SigleUser.Gender = resultSet.string(forColumn: "Gender") ?? ""
                    SigleUser.DOB = resultSet.string(forColumn: "DOB") ?? ""
                    SigleUser.Age = resultSet.int(forColumn: "Age")
                    SigleUser.CasteId = resultSet.int(forColumn: "CasteId")
                    SigleUser.Education = resultSet.string(forColumn: "Education") ?? ""
                    SigleUser.Height = resultSet.string(forColumn: "Height") ?? ""
                    SigleUser.Address = resultSet.string(forColumn: "Address")!
                    SigleUser.City = resultSet.string(forColumn: "City")!
                    SigleUser.State = resultSet.string(forColumn: "State")!
                    SigleUser.Phone = resultSet.string(forColumn: "Phone")!
                    SigleUser.Mobile = resultSet.string(forColumn: "Mobile")!
                    SigleUser.Email = resultSet.string(forColumn: "Email")!
                    SigleUser.Remarks = resultSet.string(forColumn: "Remarks")!
                    SigleUser.IsFavourite = resultSet.int(forColumn: "IsFavourite")
                    
                    
                    
                    Favouriteusers.append(SigleUser)
                    
                    
                }
            }
            catch{
                print(error)
            }
            
        }
        else{
            print("not connect datatabse")
        }
        dbconn.close()
        
        return Favouriteusers
    }
    
    class func AddUser(us:Users)->(Bool){
        
        var status : Bool = Bool()
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open(){
            
            let quary = "insert into Profile(Name,Gender,DOB,Age,CasteId,Education,Height,Address,City,State,Phone,Mobile,Email,Remarks,IsFavourite) values('\(us.Name)','\(us.Gender)','\(us.DOB)','\(us.Age)','\(us.CasteId)','\(us.Education)','\(us.Height)','\(us.Address)','\(us.City)','\(us.State)','\(us.Phone)','\(us.Mobile)','\(us.Email)','\(us.Remarks)','\(us.IsFavourite)')"
            do{
                let resultSet = try dbconn.executeUpdate(quary, withArgumentsIn: [])
                
                if resultSet {
                    status = true
                }
                else{
                    status = false
                }
            }
            catch{
                print(error)
            }
            
        }
        else{
            print("not connect datatabse")
        }
        dbconn.close()
        
        return true
    }
    
    class func DeletUser(us:Users)->(Bool){
        
        var status : Bool = Bool()
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open(){
            
            let quary = "delete from Profile where ProfileID = '\(us.ProfileID)'"
            do{
                let resultSet = try dbconn.executeUpdate(quary, withArgumentsIn: [])
                
                if resultSet {
                    status = true
                }
                else{
                    status = false
                }
            }
            catch{
                print(error)
            }
            
        }
        else{
            print("not connect datatabse")
        }
        dbconn.close()
        
        return true
        
    }
    
    class func EditUser(us:Users)->(Bool){
        
        var status : Bool = Bool()
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open(){
            
            let quary = "update Profile set Name = '\(us.Name)',Gender = '\(us.Gender)',DOB = '\(us.DOB)',Age = '\(us.Age)',CasteId = '\(us.CasteId)',Education = '\(us.Education)',Height = '\(us.Height)',Address = '\(us.Height)',City = '\(us.City)',State = '\(us.State)',Phone = '\(us.Phone)',Mobile = '\(us.Mobile)',Email = '\(us.Email)',Remarks = '\(us.Remarks)',IsFavourite = '\(us.IsFavourite)' where ProfileID = '\(us.ProfileID)' "
            do{
                let resultSet = try dbconn.executeUpdate(quary, withArgumentsIn: [])
                
                if resultSet {
                    status = true
                }
                else{
                    status = false
                }
            }
            catch{
                print(error)
            }
            
        }
        else{
            print("not connect datatabse")
        }
        dbconn.close()
        
       
        
        return true
        
    }
    
    class func Search( Gender:String , Caste:String , Age1:Int ,Age2:Int)->[Users]{
        
        var usersArray:[Users] = []
            let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
            
            if dbconn.open(){
                
                let quary = FindQuary(Gender: Gender, Caste: Caste, Age1: Age1, Age2: Age2)
                print(quary)
                do{
                    let resultSet = try dbconn.executeQuery(quary, values: [])
                    
                    while (resultSet.next()){
                        
                        let SigleUser:Users = Users()
                        
                        SigleUser.ProfileID = resultSet.int(forColumn: "ProfileID")
                        SigleUser.Name = resultSet.string(forColumn: "Name") ?? ""
                        SigleUser.Gender = resultSet.string(forColumn: "Gender") ?? ""
                        SigleUser.DOB = resultSet.string(forColumn: "DOB") ?? ""
                        SigleUser.Age = resultSet.int(forColumn: "Age")
                        SigleUser.CasteId = resultSet.int(forColumn: "CasteId")
                        SigleUser.Education = resultSet.string(forColumn: "Education") ?? ""
                        SigleUser.Height = resultSet.string(forColumn: "Height") ?? ""
                        SigleUser.Address = resultSet.string(forColumn: "Address")!
                        SigleUser.City = resultSet.string(forColumn: "City")!
                        SigleUser.State = resultSet.string(forColumn: "State")!
                        SigleUser.Phone = resultSet.string(forColumn: "Phone")!
                        SigleUser.Mobile = resultSet.string(forColumn: "Mobile")!
                        SigleUser.Email = resultSet.string(forColumn: "Email")!
                        SigleUser.Remarks = resultSet.string(forColumn: "Remarks")!
                        SigleUser.IsFavourite = resultSet.int(forColumn: "IsFavourite")
//                        SigleUser.CasteName = resultSet.string(forColumn: "CasteName")!
                        
                        
                        print(usersArray.count)
                        usersArray.append(SigleUser)
                    }
                }
                catch{
                    print(error)
                }
                
            }
            else{
                print("not connect datatabse")
            }
            dbconn.close()
            
            return usersArray
        
        
        
  
    }
}

    func FindQuary(Gender:String , Caste:String , Age1:Int ,Age2:Int)-> String{
        var ans:String = String()
        
        if Gender == "All" && Caste == "" && Age1 == 0 && Age2 == 0{
            ans = "select * from Profile"
            return ans
        }
        else if Gender != "All" && Caste == "" && Age1 == 0 && Age2 == 0{
            ans = "select * from Profile where Gender = '\(Gender)'"
            return ans
        }
        else if Gender == "All" && Caste != ""  && Age1 == 0 && Age2 == 0 {
            ans = "select * from Profile INNER JOIN Caste where Profile.CasteId=(select CasteId from Caste where CasteName = '\(Caste)' ) and Caste.CasteId = (select CasteId from Caste where CasteName = '\(Caste)')'"
            return ans
        }
        else if Gender != "All" && Caste != "" && Age1 == 0 && Age2 == 0{
            ans = "select * from Profile INNER JOIN Caste where Profile.CasteId=(select CasteId from Caste where CasteName = '\(Caste)' ) and Caste.CasteId = (select CasteId from Caste where CasteName = '\(Caste)')and Profile.Gender = '\(Gender)'"
            return ans
        }
        else if Gender == "All" && Caste == "" && Age1 != 0 && Age2 != 0 {
            ans = "select * from Profile where Age BETWEEN '\(Age1)' AND '\(Age2)'"
            return ans
        }
        else if  Gender != "All" && Caste == "" && Age1 != 0 && Age2 != 0 {
            ans = "select * from Profile where Age BETWEEN '\(Age1)' AND '\(Age2)' AND Profile.Gender = '\(Gender)'"
            return ans
        }
        else if Gender == "All" && Caste != "" && Age1 != 0 && Age2 != 0{
            ans = "select * from Profile INNER JOIN Caste where Profile.CasteId=(select CasteId from Caste where CasteName = '\(Caste)' ) and Caste.CasteId = (select CasteId from Caste where CasteName = '\(Caste)') and Age BETWEEN '\(Age1)' AND '\(Age2)'"
            return ans
        }
        else{
            ans = "select * from Profile INNER JOIN Caste where Profile.CasteId=(select CasteId from Caste where CasteName = '\(Caste)' ) and Caste.CasteId = (select CasteId from Caste where CasteName = '\(Caste)') and Profile.Gender = '\(Gender)' and Age BETWEEN '\(Age1)' AND '\(Age2)'"
            return ans
        }
    }
