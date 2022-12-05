//
//  DetailsViewController.swift
//  materiomoni
//
//  Created by Utsav busa on 21/11/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var flag:Bool = true
    var Favourite:Int = 0
    @IBOutlet weak var Star: UIBarButtonItem!
    @IBAction func StarBtn(_ sender: Any) {
        if flag{
            Star.image = UIImage(systemName: "star.fill" )
            flag = false
            DetailsObj.IsFavourite = 1
            UserDAL.EditUser(us: DetailsObj)
        }
        else{
            Star.image = UIImage(systemName: "star" )
            flag = true
            DetailsObj.IsFavourite = 0
            UserDAL.EditUser(us: DetailsObj)
        }
    }
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var Age: UILabel!
    @IBOutlet weak var Education: UILabel!
    @IBOutlet weak var Height: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var State: UILabel!
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var Mobile: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Remark: UILabel!
    @IBOutlet weak var IsFavourite: UILabel!
    @IBOutlet weak var Caste: UILabel!
    
    var DetailsObj:Users = Users()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Image.layer.masksToBounds = true
        Image.layer.cornerRadius = Image.bounds.width/2
        Image.image = UIImage(named: DetailsObj.Gender == "Male" ? "men":"women")
        Name.text = DetailsObj.Name
        Gender.text = DetailsObj.Gender
        DOB.text = DetailsObj.DOB
        Age.text = String(DetailsObj.Age)
        Education.text = DetailsObj.Education
        Height.text = DetailsObj.Height
        Address.text = DetailsObj.Address
        City.text = DetailsObj.City
        State.text = DetailsObj.State
        Phone.text = DetailsObj.Phone
        Mobile.text = DetailsObj.Mobile
        Email.text = DetailsObj.Email
        Remark.text = DetailsObj.Remarks
        IsFavourite.text = DetailsObj.IsFavourite == 0 ? "No" : "Yes"
        Caste.text = DetailsObj.CasteName
        if DetailsObj.IsFavourite == 1 {
            Star.image = UIImage(systemName: "star.fill" )
            flag = false
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
