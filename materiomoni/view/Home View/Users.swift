//
//  Users.swift
//  materiomoni
//
//  Created by Utsav busa on 20/11/22.
//

import UIKit

class Users: NSObject {

    var ProfileID:Int32 = Int32()
    var Name:String = String()
    var Gender:String = String()
    var DOB:String = String()
    var Age:Int32 = Int32()
    var CasteId:Int32 = Int32()
    var CasteName:String = String()
    var Education:String = String()
    var Height:String = String()
    var Address:String = String()
    var City:String = String()
    var State:String = String()
    var Phone:String = String()
    var Mobile:String = String()
    var Email:String = String()
    var Remarks:String = String()
    var IsFavourite:Int32 = Int32()
}

let us:Users = Users()
var queary = "insert into Profile(Name,Gender,DOB,Age,CasteId,Education,Height,Address,City,State,Phone,Mobile,Email,Remarks,IsFavourite) values('\(us.Name)','\(us.Gender)','\(us.DOB)','\(us.Age)','\(us.CasteId)','\(us.Education)','\(us.Height)','\(us.Address)','\(us.City)','\(us.State)','\(us.Phone)','\(us.Mobile)','\(us.Email)','\(us.Remarks)',,'\(us.IsFavourite)')"

var quary1 = "update Profile set Name = '\(us.Name)',Gender = '\(us.Gender)',DOB = '\(us.DOB)',Age = '\(us.Age)',CasteId = '\(us.CasteId)',Education = '\(us.Education)',Height = '\(us.Height)',Address = '\(us.Height)',City = '\(us.City)',State = '\(us.State)',Phone = '\(us.Phone)',Mobile = '\(us.Mobile)',Email = '\(us.Email)',Remarks = '\(us.Remarks)',IsFavourite = '\(us.IsFavourite)' where carId = '\(us.ProfileID)' "
